#
# Cookbook Name:: linux
# Recipe:: edifecs_config_sqlscripts.rb 
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'git' do
  action :install
end

package 'subversion' do
  action :install
end

git '/opt/Edifecs/sql_repos' do
  repository node['edifecs']['sql_repos']['git_url'] #'https://77d645649b15070e5441d239efb20213d2264acd@github.training.cerner.com/vn055798/Db_Chef_Test.git'
  revision node['edifecs']['sql_repos']['git_revision'] #'master'
  action :sync
end

#subversion 'SQL Script Files' do
 # repository node['edifecs']['sql_repos']['svn_url']
 # revision 'HEAD'
 # svn_info_args '--no-auth-cache --trust-server-cert --non-interactive'
 # svn_arguments '--no-auth-cache --trust-server-cert --non-interactive'
 # svn_username credentials_vault['svn_user']
 # svn_password credentials_vault['svn_pwd']
 # destination '/opt/Edifecs/sql_repos'
# action :force_export
# end

#
# Set environment variables
#
template '/home/edifecs/.bash_profile' do
    source 'edifecs_sqlplus.bash_profile'
    owner 'edifecs'
    group 'edifecs'
end

cookbook_file '/opt/Edifecs/sql_repos/sql.sh' do
  source 'sql.sh'
  owner 'edifecs'
  group 'edifecs'
  mode '0755'
  action :create
end

cookbook_file '/opt/Edifecs/sql_repos/git_check_update.sh' do
  source 'git_check_update.sh'
  owner 'edifecs'
  group 'edifecs'
  mode '0755'
  action :create
end

cron 'Check for GIT update' do
  hour '0'
  minute '5'
  command "sudo /bin/bash -c '/opt/Edifecs/sql_repos/git_check_update.sh'"
end