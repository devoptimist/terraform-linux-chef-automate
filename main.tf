locals {
  instance_count = var.instance_count # length(var.ips)
  dna = [
    for ip in var.ips :
    {
      "chef_automate_wrapper" = {
        "channel"         = var.channel,
        "version"         = var.install_version,
        "config"          = var.config,
        "accept_license"  = var.accept_license,
        "creds_json_path" = var.json_credentials_path,
        "dc_token"        = var.data_collector_token,
        "fqdn"            = length(var.fqdns) != 0 ? var.fqdns[index(var.ips, ip)] : "",
        "cert"            = length(var.certs) != 0 ? var.certs[index(var.ips, ip)] : "",
        "cert_key"        = length(var.cert_keys) != 0 ? var.cert_keys[index(var.ips, ip)] : "",
        "admin_password"  = var.admin_password,
        "data_script"     = var.data_source_script_path,
        "license"         = var.chef_automate_license
      }
    }
  ]
  module_inputs = [
    for ip in var.ips :
    {
      "chef_automate_wrapper" = {
      }
    }
  ]
}

module "chef_automate_build" {
  source           = "/home/steveb/workspace/terraform/modules/devoptimist/terraform-chef-policyfile"
  ips              = var.ips
  instance_count   = local.instance_count
  dna              = local.dna
  module_inputs    = local.module_inputs
  cookbooks        = var.cookbooks
  runlist          = var.runlist
  user_name        = var.ssh_user_name
  user_pass        = var.ssh_user_pass
  user_private_key = var.ssh_user_private_key
}

data "external" "a2_secrets" {
  count = local.instance_count
  program = ["bash", "${path.module}/files/data_source.sh"]
  depends_on = ["module.chef_automate_build"]

  query = {
    ssh_user        = var.ssh_user_name
    ssh_key         = var.ssh_user_private_key
    ssh_pass        = var.ssh_user_pass
    target_ip       = var.ips[count.index]
    target_script   = var.data_source_script_path
  }
}
