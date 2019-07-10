#
# Cookbook:: edifecs
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


user 'edifecs' do
    manage_home true
    home    '/home/edifecs'
    password '$1$sMOM3Uh0$EjWPgiyDPWsXn7PEPNHCZ0'
    uid '500'
end

group 'edifecs' do
    gid '501'
end
#
# Setup universal directories
#
directory '/opt/EdifecsSetup' do
    owner 'edifecs'
    group 'edifecs'
end
directory '/home/edifecs/bin' do
    owner 'edifecs'
    group 'edifecs'
end