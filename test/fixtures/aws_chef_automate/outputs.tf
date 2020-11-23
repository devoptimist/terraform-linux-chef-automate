output "private_ip" {
  value = module.aws_chef_automate.private_ip
}

output "admin_pass" {
  value = module.aws_chef_automate.admin_pass
}

output "token" {
  value = module.aws_chef_automate.token
}

output "url" {
  value = module.aws_chef_automate.url
}

output "data_collector_url" {
  value = module.aws_chef_automate.data_collector_url
}
