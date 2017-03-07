#
# Cookbook Name:: gocd-server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Install and configure the server.

include_recipe 'gocd::server_linux_install'

# # Install the slack notifier
# gocd_plugin 'slack-notifier' do
#   plugin_uri 'https://github.com/ashwanthkumar/gocd-slack-build-notifier/releases/download/v1.4.0-RC11/gocd-slack-notifier-1.4.0-RC11.jar'
# end

# gocd_plugin 'github-oauth' do
#   plugin_uri 'https://github.com/gocd-contrib/gocd-oauth-login/releases/download/v1.2/github-oauth-login-1.2.jar'
# end

# gocd_plugin 'github-pull-request-builder' do
#   plugin_uri 'https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.3.1/github-pr-poller-1.3.1.jar'
# end

# gocd_plugin 'github-pull-request-status-notifier' do
#   plugin_uri 'https://github.com/gocd-contrib/gocd-build-status-notifier/releases/download/1.2/github-pr-status-1.2.jar'
# end

# gocd_plugin 'json-config' do
#   plugin_uri 'https://github.com/tomzo/gocd-json-config-plugin/releases/download/0.2.0/json-config-plugin-0.2.jar'
# end

# gocd_plugin 'yaml-config' do
#   plugin_uri 'https://github.com/tomzo/gocd-yaml-config-plugin/releases/download/0.4.0/yaml-config-plugin-0.4.0.jar'
# end

# Install Git onto the server.
apt_package 'git' do
  action :install
end
