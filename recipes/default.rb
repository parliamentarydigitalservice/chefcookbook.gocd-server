#
# Cookbook Name:: gocd-server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'gocd::server'

# Install the nuget poller.
gocd_plugin 'go-nuget-poller' do
  plugin_uri 'https://github.com/ThoughtWorksInc/go-nuget-poller-plugin/releases/download/v1.0.2/go-nuget-poller-plugin.jar'
end

gocd_plugin 'artifactory-poller' do
  plugin_uri 'https://github.com/varchev/go-generic-artifactory-poller/releases/download/0.1.0/go-generic-artifactory-poller.jar'
end
