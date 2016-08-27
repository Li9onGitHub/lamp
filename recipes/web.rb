#
# Cookbook Name:: lamp
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
# Install Apache and start the service.
httpd_service 'customers' do
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
end

# Create the document root directory.
directory node['lamp']['document_root'] do
  recursive true
end

# Deploy content.
node['lamp']['content_files'].each do |file|
  cookbook_file File.join(node['lamp']['document_root'], file) do
    source file
    mode '0644'
    owner node['lamp']['user']
    group node['lamp']['group']
  end
end

# Write the home page.
template "#{node['lamp']['document_root']}/dbvars.php" do
  source 'dbvars.php.erb'
  mode '0644'
  owner node['lamp']['user']
  group node['lamp']['group']
end

# Install the mod_php5 Apache module.
httpd_module 'php5' do
  instance 'customers'
end

# Install php5-mysqlnd
package 'php5-mysqlnd' do
  action :install
end

# Install php5-mysql.
package 'php5-mysql' do
  action :install
  notifies :restart, 'httpd_service[customers]'
end
