output "ip" {
  value = var.ips
}

output "ssh_user" {
  value = var.ssh_user_name
}

output "admin_user" {
  value = data.external.a2_secrets[*].result["username"]
}

output "admin_pass" {
  value = data.external.a2_secrets[*].result["password"]
}

output "token" {
  value = data.external.a2_secrets[*].result["token"]
}

output "url" {
  value = data.external.a2_secrets[*].result["url"]
}
