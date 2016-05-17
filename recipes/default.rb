#
# Cookbook Name:: site24x7
# Recipe:: default
#
# Copyright 2014
#
# All rights reserved - Do Not Redistribute
#

if node['site24x7']['api_key'].empty?
  Chef::Log.info('Site24x7 API key missing. Skipping installation...')
else
  directory '/tmp/site24x7agent' do
    mode 0755
    action :create
  end

  site24x7 'get_package' do
    package node['site24x7']['package']
    action :create
  end

  file "/tmp/site24x7agent/#{node['site24x7']['package']}" do
    mode 0755
  end

  site24x7 'install' do
    key node['site24x7']['api_key']
    package node['site24x7']['package']
    proxy node['site24x7']['proxy']
    action :install
  end

  service 'site24x7monagent' do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
  end
end
