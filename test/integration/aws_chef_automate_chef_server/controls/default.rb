admin_pass = input('admin_pass')
url = input('url')
token = input('token')
data_collector_url = input('data_collector_url')
private_ip = input('private_ip')

expected_admin_password = input('expected_admin_password')
expected_token = input('expected_token')
expected_url = "https://#{private_ip}"
expected_data_collector_url = "https://#{private_ip}/data-collector/v0/"

validation_pem = input('validation_pem')
validation_client_name = input('validation_client_name')
client_pem = input('client_pem')
org_name = input('org_name')
org_url = input('org_url')
base_url = input('base_url')
node_name = input('node_name')

expected_org_name = input('expected_org_name')
expected_validation_client_name = input('expected_validation_client_name')
expected_base_url = "https://#{private_ip}"
expected_org_url = "https://#{private_ip}/organizations/#{org_name}"
expected_node_name = input('expected_node_name')

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

describe validation_pem do
  it { should_not eq '' }
end

describe validation_client_name do
  it { should eq expected_validation_client_name }
end

describe client_pem do
  it { should_not eq '' }
end

describe org_name do
  it { should eq expected_org_name }
end

describe org_url do
  it { should eq expected_org_url }
end

describe base_url do
  it { should eq expected_base_url }
end

describe node_name do
  it { should eq expected_node_name }
end
