locals {
  dna = {
    "chef_automate_wrapper" = {
      "channel"                  = var.channel,
      "products"                 = var.products,
      "version"                  = var.install_version,
      "config"                   = var.config,
      "accept_license"           = var.accept_license,
      "creds_json_path"          = var.json_credentials_path,
      "dc_token"                 = var.ingest_token,
      "hostname_method"          = var.hostname_method,
      "fqdn"                     = var.fqdn,
      "cert"                     = var.cert,
      "cert_key"                 = var.cert_key,
      "admin_password"           = var.admin_password,
      "data_script"              = var.data_source_script_path,
      "license"                  = var.chef_automate_license,
      "patching_override_origin" = var.patching_override_origin
      "patching_hartifacts_path" = var.patching_hartifacts_path
    }
  }
}

module "chef_automate_build" {
  source            = "srb3/effortless-bootstrap/chef"
  version           = "0.13.1"
  ip                = var.ip
  user_name         = var.ssh_user_name
  user_pass         = var.ssh_user_pass
  user_private_key  = var.ssh_user_private_key
  config            = local.dna
  proxy_string      = var.proxy_string
  no_proxy_string   = var.no_proxy_string
  effortless_pkg    = var.automate_effortless_package
}

data "external" "a2_secrets" {
  program    = ["bash", "${path.module}/files/data_source.sh"]
  depends_on = [module.chef_automate_build]

  query = {
    ssh_user        = var.ssh_user_name
    ssh_key         = var.ssh_user_private_key
    ssh_pass        = var.ssh_user_pass
    target_ip       = var.ip
    target_script   = var.data_source_script_path
  }
}
