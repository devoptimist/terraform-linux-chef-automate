admin_pass = input('admin_pass')
url = input('url')
token = input('token')
data_collector_url = input('data_collector_url')
private_ip = input('private_ip')

expected_admin_password = input('expected_admin_password')
expected_token = input('expected_token')
expected_url = "https://#{private_ip}"
expected_data_collector_url = "https://#{private_ip}/data-collector/v0/"

describe admin_pass do
  it { should eq expected_admin_password }
end

describe token do
  it { should eq expected_token }
end

describe url do
  it { should eq expected_url }
end

describe data_collector_url do
  it { should eq expected_data_collector_url }
end
