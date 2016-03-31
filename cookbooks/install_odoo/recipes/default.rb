#
# Cookbook Name:: install_odoo
# Recipe:: default
#
# Copyright (c) 2016 Michael Doederlein, All Rights Reserved.
include_recipe 'apt::default'
include_recipe 'install_odoo::add_user'
include_recipe 'install_odoo::postgresql'
include_recipe 'install_odoo::install_packages'
include_recipe 'install_odoo::odoo'
