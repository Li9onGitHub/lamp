#
# Cookbook Name:: build-cookbook
# Recipe:: syntax
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'delivery-truck::syntax'

cb = run_context.cookbook_collection[cookbook_name]

cb.manifest['files'].each do |cbf|

  filepath = cbf['path']
  filename = cbf['name']

  next if not filepath.end_with? "php"

  log 'PROCESSING FILE: ' + filepath + '/' + filename


  execute filename do
    command 'php -l ' + filepath + '/' + filename
    action :run
  end 
  
end


