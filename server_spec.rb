require 'serverspec'
require 'pathname'
require 'net/ssh'

include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS

describe package('nodejs') do
  it { should be_installed }
end

describe package('npm') do
  it { should be_installed }
end

describe command('npm --version') do
  it { should return_stdout(/\d+\.\d+\.\d+/)}
end

describe command('lt --help') do
  it { should return_stdout(/Usage: .+\/lt --port /)}
end


describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
    it { should be_enabled }
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