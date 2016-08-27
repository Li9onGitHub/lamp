#
# Cookbook Name:: lamp
# Recipe:: firewall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'firewall::default'

ports = node.default['lamp']['open_ports']
firewall_rule "open ports #{ports}" do
  port ports
end
