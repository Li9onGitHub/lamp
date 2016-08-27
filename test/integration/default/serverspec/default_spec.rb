require 'spec_helper'

describe 'the customers web application' do
  it 'is up and running' do
    expect(command('wget -qO- localhost').stdout).to match %r{<title>Customers<\/title>}
  end
end

describe 'the web_admin user' do
  it 'has home directory /home/web_admin' do
    expect(user('web_admin')).to have_home_directory '/home/web_admin'
  end

  it 'has login shell /bin/bash' do
    expect(user('web_admin')).to have_login_shell '/bin/bash'
  end
end

describe 'the web content' do
  Dir.glob('/var/www/customers/**/*.php') do |web_file|
    it "#{web_file} is owned by web_admin" do
      expect(file(web_file)).to be_owned_by 'web_admin'
      expect(file(web_file)).to be_grouped_into 'web_admin'
    end
  end
end

describe 'the apache2-customers service' do
  it 'is enabled' do
    expect(service('apache2-customers')).to be_enabled
  end
  it 'is running' do
    expect(service('apache2-customers')).to be_running
  end
end

describe 'the default home page' do
  let(:index) { '/var/www/customers/public_html/index.php' }
  it 'exists' do
    expect(file(index)).to exist
  end
  it 'is a file' do
    expect(file(index)).to be_file
  end
  it 'has mode 644' do
    expect(file(index)).to be_mode 644
  end
end
