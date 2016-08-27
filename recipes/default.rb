#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'lamp::package_cache'
include_recipe 'lamp::firewall'
include_recipe 'lamp::user'
include_recipe 'lamp::web'
include_recipe 'lamp::database'
