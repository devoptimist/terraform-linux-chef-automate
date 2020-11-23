output "private_ip" {
  value = module.instance["automate"].private_ip[0]
}

output "admin_pass" {
  value = module.chef_automate.admin_pass
}

output "token" {
  value = module.chef_automate.token
}

output "url" {
  value = module.chef_automate.url
}

output "data_collector_url" {
  value = module.chef_automate.data_collector_url
}

output "validation_pem" {
  value = module.chef_automate.validation_pem
}

output "validation_client_name" {
  value = module.chef_automate.validation_client_name
}

output "client_pem" {
  value = module.chef_automate.client_pem
}

output "org_name" {
  value = module.chef_automate.org_name
}

output "org_url" {
  value = module.chef_automate.org_url
}

output "base_url" {
  value = module.chef_automate.base_url
}

output "node_name" {
  value = module.chef_automate.node_name
}
