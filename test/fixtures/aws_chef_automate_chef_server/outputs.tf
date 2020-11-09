output "private_ip" {
  value = module.aws_chef_automate_chef_server.private_ip
}

output "admin_pass" {
  value = module.aws_chef_automate_chef_server.admin_pass 
}

output "token" {
  value = module.aws_chef_automate_chef_server.token
}

output "url" {
  value = module.aws_chef_automate_chef_server.url
}

output "data_collector_url" {
  value = module.aws_chef_automate_chef_server.data_collector_url
}

output "validation_pem" {
  value = module.aws_chef_automate_chef_server.validation_pem
}

output "validation_client_name" {
  value = module.aws_chef_automate_chef_server.validation_client_name
}

output "client_pem" {
  value = module.aws_chef_automate_chef_server.client_pem
}

output "org_name" {
  value = module.aws_chef_automate_chef_server.org_name
}

output "org_url" {
  value = module.aws_chef_automate_chef_server.org_url
}

output "base_url" {
  value = module.aws_chef_automate_chef_server.base_url
}

output "node_name" {
  value = module.aws_chef_automate_chef_server.node_name
}
