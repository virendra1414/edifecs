#
# Java
#
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = 'true'
default['java']['oracle']['jce']['enabled'] = 'true'
default['java']['jdk_version'] = '8'
default['java']['jdk']['8']['x86_64']['url'] = 'https://nexus.edi.cerner.corp/service/local/repositories/thirdparty/content/oracle/jdk/8u131-linux/jdk-8u131-linux-x64.tar.gz'

#
# Tomcat/Legacy Tracking
#
default['edifecs']['repository_url'] = 'https://nexus.edi.cerner.corp'
default['edifecs']['batch_rest']['version'] = 'LATEST'
default['edifecs']['batch_rest']['root_log_level'] = 'INFO'
default['edifecs']['batch_rest']['log_levels'] = {
    "com.cerner.hdxts.legacytracking" => "DEBUG"
    #"org.springframework" => "DEBUG"
}
# Tomcat context.xml template
default['edifecs']['hdxts_tomcat']['oauth_url'] = 'https://authorization.devcerner.com/introspection'
default['edifecs']['hdxts_tomcat']['database_url'] = 'jdbc:oracle:thin:@//cernrdcdevcertdb1.northamerica.cerner.net:1521/edicrt.world'
default['edifecs']['hdxts_tomcat']['nfs']['mount_point'] = 'localhost:/export/edifecs/test'
default['edifecs']['hdxts_tomcat']['archives']['mount_point'] = 'localhost:/export/claims/test/archives'
default["edifecs"]["hdxts_tomcat"]["databag_secrets_path"] = '/etc/chef/rcts_oauth_databag_secret'
default["edifecs"]["hdxts_tomcat"]["hikari_conf"]["minIdleConnections"] = '5'
default["edifecs"]["hdxts_tomcat"]["hikari_conf"]["maxPoolSize"] = '25'
default["edifecs"]["hdxts_tomcat"]["hikari_conf"]["connectionTimeOut"] = '30000'
default["edifecs"]["hdxts_tomcat"]["hikari_conf"]["leakDetectionThreshold"] = '90000'
default["edifecs"]["hdxts_tomcat"]["hikari_conf"]["maxStatements"] = '10'

# TM install properties
default['edifecs']['database']['diskgroup'] = 'EDFXCHEF_DG1'
default["edifecs"]["database"]["databag_secrets_path"] = '/etc/chef/rcts_db_databag_secret'
# Mount points
# Client
default['edifecs']['nfs_client']['edifecs_share']['mount_point'] = 'localhost:/export/edifecs_system'
default['edifecs']['nfs_client']['hdxts_share']['mount_point'] = 'localhost:/export/edifecs/test'
default['edifecs']['nfs_client']['edifecs_packages']['mount_point'] = 'localhost:/opt/EdifecsSetup'
default['edifecs']['nfs_application_client']['routes']['mount_point'] = 'localhost:/export/claims/test/routes'
# Server
default['edifecs']['nfs_server']['hdxts_share']['mount_env'] = 'test'
# Application client
#default['edifecs']['xes_server']['tran_stage']['mount_point'] = 'localhost:/mnt/routes/sources/tran_stage'
#default['edifecs']['xes_server']['out_stage']['mount_point'] = 'localhost:/mnt/routes/dests/out_stage'
#properties changes for XES server
default['edifecs']['xes_server']['properties']['batch_tracking_service_url'] = 'http\://edfxtstcapp001.northamerica.cerner.net/domain/batchtracking/'
default['edifecs']['xes_server']['server_count'] = '2'
default['edifecs']['tip_profiles']['version'] = '1.0.0'
default['edifecs']['xes_server']['properties']['mainframe']['ftp_path'] = 'test'
default['edifecs']['xes_server']['properties']['mainframe']['environment'] = 'tst0'
default['edifecs']['xes_server']['properties']['mainframe']['db_url'] = 'T1'
default['edifecs']['xes_server']['properties']['mainframe']['db_portnumber'] = '50050'
default['edifecs']['xes_server']['properties']['mainframe']['db_dns'] = 'hdxdb2.asp.cernerworks.com'

#
# Websphere MQ
#
default['edifecs']['mq']['environment_name'] = 'LOCALHOST'
default['edifecs']['mq']['base_queue_manager_name'] = 'CERN.EDFXMQ00'
default['edifecs']['mq']['databag_secrets_path'] = '/etc/chef/rcts_mq_databag_secret'
#
# System settings
#
default['edifecs']['yum_repos']['location'] = 'http://taspmocorplnxmgmt.northamerica.cerner.net/yum/repos/rhel7/7.2/rhn/wkly/rhel7.2_patchset_201643_CORP.repo'
default['edifecs']['repository_cert_path'] = '/opt/chef/embedded/ssl/certs/edi_nexus.pem'
default['edifecs']['chef_client_cert_path'] = '/opt/chef/embedded/ssl/certs/cacert.pem'
default['edifecs']['hostname_prefix'] = 'edfxtst'
default['edifecs']['tm_stack_count'] = '4'
default['edifecs']['limits']['nofile'] = '30000'
default['edifecs']['limits']['nproc'] = '50000'

#
# SFTP Credentials
#
default['edifecs']['sftp_mainframe']['databag_secrets_path'] = '/etc/chef/rcts_sftp_databag_secret'

#
# DB automate tests settings
#
default['edifecs']['sql_repos']['databag_secrets_path'] = '/etc/chef/rcts_repos_sql_databag_secret'
default['edifecs']['sql_repos']['git_url'] = 'https://github.com/VenkataSN/Db_test.git'
default['edifecs']['sql_repos']['git_revision'] = 'master'
default['edifecs']['sql_repos']['svn_url'] = 'http://scm.healthe-edi.cerner.corp/svn/com.cerner.edi.schema/trunk/edi-epayment-recon/'
default['oracle-instantclient']['version']='1.8'