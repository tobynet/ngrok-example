require_relative '../spec_helper'


include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS

describe package('ufw') do
  it { should be_installed }
end

describe service('ufw') do
  it { should be_enabled }
  it { should be_running }
end

describe port('22') do
  it { should be_listening }
end


describe command('/opt/ngrok/ngrok help') do
  it { should return_stdout(%r{\AUsage: /opt/ngrok/ngrok \[OPTIONS\] <local port or address>})}
end


describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running   }
end

describe port(80) do
  it { should be_listening }
end

describe command('curl -s http://localhost:80/') do
  it { should return_stdout(%r{<center><h1>Welcome to nginx!</h1></center>})}
end

describe port(80) do
  it { should be_listening }
  it { should be_listening.with('tcp') }
end

# describe file('/var/www/html/index.html') do
#   it { should be_file }
# end
