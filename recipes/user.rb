#
# Cookbook Name:: lamp
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
group node['lamp']['group']

user node['lamp']['user'] do
  group node['lamp']['group']
  system true
  shell '/bin/bash'
end
