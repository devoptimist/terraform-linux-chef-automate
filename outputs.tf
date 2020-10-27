output "ip" {
  value = var.ip
}

output "ssh_user" {
  value = var.ssh_user_name
}

output "admin_user" {
  value = local.a2_secrets["username"]
}

output "admin_pass" {
  value = local.a2_secrets["password"]
}

output "token" {
  value = local.a2_secrets["token"]
}

output "url" {
  value = local.a2_secrets["url"]
}

output "data_collector_token" {
  value = local.a2_secrets["token"]
}

output "data_collector_url" {
  value = format("%s/data-collector/v0/", local.a2_secrets["url"])
}
