#
# Cookbook Name:: install_odoo
# Recipe:: add_user
#
# Copyright (c) 2016 Michael Doederlein, All Rights Reserved.

group 'odoo group' do
  action :create
  group_name 'odoo'
end

user 'odoo user' do
  username 'odoo'
  comment 'odoo system user'
  system true
  shell '/bin/bash'
  home '/opt/odoo'
  group 'odoo'
end

group 'add odoo to sudo' do
  action :modify
  group_name 'sudo'
  members 'odoo'
  append true
end
