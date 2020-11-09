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

########### Chef Server Outputs ##################
# if automate deployed chef server is not enabled
# then these outputs will be an empty string

output "validation_pem" {
  value = local.a2_secrets["validation_pem"]
}

output "validation_client_name" {
  value = local.a2_secrets["validation_client_name"]
}

output "client_pem" {
  value = local.a2_secrets["client_pem"]
}

output "org_name" {
  value = local.a2_secrets["org_name"]
}

output "org_url" {
  value = local.a2_secrets["org_url"]
}

output "base_url" {
  value = local.a2_secrets["base_url"]
}

output "node_name" {
  value = local.a2_secrets["node_name"]
}
