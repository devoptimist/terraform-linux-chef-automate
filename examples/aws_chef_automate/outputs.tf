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
