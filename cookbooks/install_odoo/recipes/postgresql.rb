#
# Cookbook Name:: install_odoo
# Recipe:: postgresql
#
# Copyright (c) 2016 Michael Doederlein, All Rights Reserved.

# Install postgresql client and server
include_recipe 'postgresql::server'
include_recipe 'postgresql::client'
# include_recipe 'postgresql::ruby'

execute 'create dbuser' do
  user "postgres"
  command "createuser -s odoo"
  returns [0, 1]
# die Sache mit returns ist unschön gelöst. Stört zwar nicht, aber er übergeht damit den return code 
# sollte noch mal verbessert werden ;-)
end

# connection info to create user
#postgresql_connection_info = {
#  :host     => '127.0.0.1',
#  :username => 'postgres',
#}

# Create a mysql user
#include_recipe 'database::postgresql'

#postgresql_database_user 'odoo' do
#  connection postgresql_connection_info
#  password   'super_secret'
#  action     :create
#end

#postgresql_database_user 'odoo' do
#   connection postgresql_connection_info
#   database_name 'template1'
#   privileges  [:all]
#   action     :grant
#end
