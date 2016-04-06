#
# Cookbook Name:: gocd-server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Install and configure the server.
include_recipe 'gocd::server_linux_install'

# Install the nuget poller.
gocd_plugin 'go-nuget-poller' do
  plugin_uri 'https://github.com/ThoughtWorksInc/go-nuget-poller-plugin/releases/download/v1.0.2/go-nuget-poller-plugin.jar'
end

# Install the artifactory poller
gocd_plugin 'artifactory-poller' do
  plugin_uri 'https://github.com/varchev/go-generic-artifactory-poller/releases/download/0.1.0/go-generic-artifactory-poller.jar'
end

# Install the slack notifier
gocd_plugin 'slack-notifier' do
  plugin_uri 'https://github.com/ashwanthkumar/gocd-slack-build-notifier/releases/download/v1.1.2/gocd-slack-notifier-1.1.2.jar'
end

# Install Git onto the server.
apt_package 'git' do
  action :install
end
