#
# Cookbook Name:: install_odoo
# Recipe:: odoo
#
# Copyright (c) 2016 Michael Doederlein, All Rights Reserved.
#
git "#{node['install_odoo']['homedir']}/odoo-server" do
  user node['install_odoo']['user']
  group node['install_odoo']['group']
  depth 1
  repository node['install_odoo']['git_odoo_repository']
  revision node['install_odoo']['git_odoo_branch']
  action :sync
end

# make directory for custom addons
execute 'mkdir-custom-add' do
  user node['install_odoo']['user']
  group node['install_odoo']['group']
  command "mkdir -p #{node['install_odoo']['custom_addons']}"
  not_if { File.exist?("#{node['install_odoo']['custom_addons']}") }
end

# install further requirements
#execute 'pip-install' do
#  command 'pip install -r /opt/odoo/odoo-server/requirements.txt'
#  not_if 'pip list | awk \'{print $1}\' | grep xlwt'
#end
