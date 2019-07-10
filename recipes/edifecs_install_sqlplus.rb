#
# Cookbook: linux
# Recipe: edifecs_install_sqlplus
#
bin_path = '/usr/bin/sqlplus'
client_arch = 'client64'
alt_path = "/usr/lib/oracle/#{node['oracle-instantclient']['version']}/#{client_arch}/bin/sqlplus"
install_cmd = 'update-alternatives --install #{bin_path} sqlplus #{alt_path} 1000'
# Install alien package
execute 'Install alien' do
  command 'apt-get install alien -y'
end
# Copy cookbook files
remote_directory '/opt/Edifecs/oracle' do
  source 'oracle'
  files_owner 'edifecs'
  files_group 'edifecs'
  files_mode '0750'
  action :create
  recursive true
end
# Install all rpm files
['*-basic-*', '*-devel-*', '*-sqlplus-*'].each do |file|
  execute "Install rpm oracle-instantclient#{file}.rpm" do
    command "alien -i /opt/Edifecs/oracle/oracle-instantclient#{file}.rpm"
  end
end
# Install libaio1 library
execute 'Install libaio1' do
  command 'apt-get install libaio1 -y'
end
execute 'ldconfig' do
  command 'ldconfig'
  action :nothing
end

template '/etc/ld.so.conf.d/oracle-instantclient-86_64.conf' do
  source 'ld.so.conf.d/oracle-instantclient-86_64.conf.erb'
  owner 'edifecs'
  group 'edifecs'
  mode '0644'
  variables(
      :version => node['oracle-instantclient']['version'],
      :client_arch => client_arch
  )
  notifies :run, 'execute[ldconfig]'
end
# OracleUtils: Adding alternative for sqlplus
execute 'alternatives for sqlplus' do
  command #{install_cmd}
  only_if "update-alternatives --display sqlplus | grep #{alt_path}"
end
# Rename SQLPlus64 to sqlplus
execute 'Rename sqlplus' do
  command "mv #{bin_path}64 #{bin_path}" 
  only_if "::File.exist?(#{bin_path}64)"
end

