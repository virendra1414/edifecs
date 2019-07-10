# 
# Cookbook Name:: linux
# Recipe:: edifecs_exec_sqlscripts
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Copy all SQL source files from git repository
git '/opt/Edifecs/sql_repos' do
  repository node['edifecs']['sql_repos']['git_url']
  revision node['edifecs']['sql_repos']['git_revision']
  action :sync
end
# Alternately copy SQL source files from SVN repository
subversion 'SQL Script Files' do
  repository node['edifecs']['sql_repos']['svn_url']
  revision 'HEAD'
  svn_info_args '--no-auth-cache --trust-server-cert --non-interactive'
  svn_arguments '--no-auth-cache --trust-server-cert --non-interactive'
  svn_username node['edifecs']['sql_repos']['svn_user']
  svn_password node['edifecs']['sql_repos']['svn_pwd']
  destination '/opt/Edifecs/sql_repos'
  action :force_export
end
# Copy cookbook file sql.sh
cookbook_file '/opt/Edifecs/sql_repos/sql.sh' do
  source 'sql.sh'
  owner 'edifecs'
  group 'edifecs'
  mode '0755'
  action :create
end
# Execute bash script
execute 'Run SQL scripts' do
  command '/opt/Edifecs/sql_repos/sql.sh /opt/Edifecs/sql_repos/git/'
  returns 0
end
