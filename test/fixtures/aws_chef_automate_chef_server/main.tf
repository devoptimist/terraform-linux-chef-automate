module "aws_chef_automate_chef_server" {
  source = "../../../examples/aws_chef_automate_chef_server"
  aws_region                         = var.aws_region
  aws_profile                        = var.aws_profile
  aws_creds_file                     = var.aws_creds_file
  aws_key_name                       = var.aws_key_name
  chef_automate_ingress_cidrs        = var.chef_automate_ingress_cidrs
  chef_automate_ssh_user_private_key = var.chef_automate_ssh_user_private_key
  chef_automate_products             = var.chef_automate_products
  chef_automate_ingest_token         = var.chef_automate_ingest_token
  chef_automate_admin_password       = var.chef_automate_admin_password
  chef_server_users                  = var.chef_server_users
  chef_server_orgs                   = var.chef_server_orgs
  tags                               = var.tags
}
