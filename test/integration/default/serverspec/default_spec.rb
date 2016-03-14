require 'spec_helper'

describe 'go server service' do
  it 'should be running' do
    expect(service('go-server')).to be_running
    expect(service('go-server')).to be_enabled
  end

  it 'should be listening on port 8153' do
    expect(port(8153)).to be_listening
  end

  it 'should be listening on port 8154' do
    expect(port(8154)).to be_listening
  end
end
