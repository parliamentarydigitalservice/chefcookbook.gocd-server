#
# Cookbook Name:: gocd-server
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'gocd::server' do
  shared_examples_for :server_recipe do
    it 'includes java recipe' do
      expect(chef_run).to include_recipe('java::default')
    end
    it 'creates go server configuration in /etc/default/go-server' do
      expect(chef_run).to render_file('/etc/default/go-server').with_content { |content|
        expect(content).to_not include('java-6')
      }
    end
    it 'configures go-server service' do
      expect(chef_run).to enable_service('go-server')
      expect(chef_run).to start_service('go-server')
    end
  end
end