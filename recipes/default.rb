include_recipe "dela::base-default"

# Register Dela as HopsWorks service
bash 'set_dela_as_enabled' do
  user "root"
  group "root"
  code <<-EOH
    #{node['ndb']['scripts_dir']}/mysql-client.sh -e \"INSERT INTO hopsworks.variables values('dela_enabled', '#{node['dela']['enabled']}')\"
  EOH
  not_if "#{node['ndb']['scripts_dir']}/mysql-client.sh -e \"SELECT * FROM hopsworks.variables WHERE id='dela_enabled'\" | grep dela_enabled"
end

service_name=node['dela']['service']
if node['kagent']['enabled'] == "true"
   kagent_config service_name do
     service service_name
     log_file "#{node['dela']['logs']}"
     config_file "#{node['dela']['home']}/conf/application.conf"
   end
end
