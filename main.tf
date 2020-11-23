locals {
  orgs      = var.chef_server_orgs
  users     = var.chef_server_users
  init_user = length(keys(local.orgs)) != 0 ? local.orgs[keys(local.orgs)[0]]["admins"][0] : ""
  init_org  = length(keys(local.orgs)) != 0 ? keys(local.orgs)[0] : ""

  consul_policyfile_name = "consul"

  tmp_path    = "${var.tmp_path}/${split("/", var.automate_effortless_package)[1]}"
  data_script = "${local.tmp_path}/${var.data_source_script}"

  consul_tmp_path = "${var.tmp_path}/${local.consul_policyfile_name}"

  consul_populate_script_lock_file = "${local.consul_tmp_path}/consul_populate.lock"

  consul_populate_script = templatefile("${path.module}/templates/consul_populate_script", {
    data_script     = local.data_script
    consul_tmp_path = local.consul_tmp_path
    consul_port     = var.consul_port
    lock_file       = local.consul_populate_script_lock_file
  })

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
      "data_script"              = local.data_script,
      "license"                  = var.chef_automate_license,
      "patching_override_origin" = var.patching_override_origin,
      "patching_hartifacts_path" = var.patching_hartifacts_path,
      "init_user"                = local.init_user,
      "init_org"                 = local.init_org,
      "chef_users"               = local.users,
      "chef_orgs"                = local.orgs,
    }
  }
}

module "chef_automate_build" {
  source           = "srb3/effortless-bootstrap/chef"
  version          = "0.13.1"
  ip               = var.ip
  user_name        = var.ssh_user_name
  user_pass        = var.ssh_user_pass
  user_private_key = var.ssh_user_private_key
  config           = local.dna
  proxy_string     = var.proxy_string
  no_proxy_string  = var.no_proxy_string
  effortless_pkg   = var.automate_effortless_package
}

module "consul" {
  source                    = "srb3/consul/util"
  version                   = "0.13.5"
  ip                        = var.ip
  user_name                 = var.ssh_user_name
  user_private_key          = var.ssh_user_private_key
  populate_script           = local.consul_populate_script
  populate_script_lock_file = local.consul_populate_script_lock_file
  datacenter                = var.consul_datacenter
  linux_tmp_path            = var.tmp_path
  policyfile_name           = local.consul_policyfile_name
  port                      = var.consul_port
  log_level                 = var.consul_log_level
  depends_on                = [module.chef_automate_build]
}

data "http" "a2_secrets" {
  url = "http://${var.ip}:${var.consul_port}/v1/kv/a2-secrets?raw"
  request_headers = {
    Accept = "application/json"
  }
  depends_on = [module.consul]
}

locals {
  a2_secrets = jsondecode(data.http.a2_secrets.body)
}
