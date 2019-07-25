################ connection ###########################

variable "ips" {
  type    = list(string)
  default = []
}

variable "ssh_user_name" {
  type    = string
  default = "chefuser"
}

variable "ssh_user_pass" {
  type    = string
  default = "P@55w0rd1"
}

variable "ssh_user_private_key" {
  type    = string
  default = ""
}

################# policyfile module ###################

variable "cookbooks" {
  default = {
    "chef_automate_wrapper" = "github: 'devoptimist/chef_automate_wrapper', tag: 'v0.1.7'",
    "chef-ingredient" = "github: 'chef-cookbooks/chef-ingredient', tag: 'v3.1.1'"
  }
}

variable "runlist" {
  type    = list(string)
  default = ["chef_automate_wrapper::default"]
}

################ attribute json #####################

variable "data_source_script_path" {
  type    = string
  default = "/var/tmp/chef_automate_details.sh"
}

variable "channel" {
  type    = string
  default = "current"
}

variable "install_version" {
  type    = string
  default = "latest"
}

variable "config" {
  type    = string
  default = ""
}

variable "accept_license" {
  default = true
}

variable "json_credentials_path" {
  type    = string
  default = "/tmp/automate-credentials.json"
}

variable "data_collector_token" {
  type    = string
  default = ""
}

variable "hostname" {
  type    = string
  default = ""
}

variable "admin_password" {
  type    = string
  default = ""
}

variable "instance_count" {
  default = 1
}

variable "chef_automate_license" {
  type    = string
  default = ""
}

variable "fqdns" {
  type    = list(string)
  default = []
}

variable "certs" {
  type    = list(string)
  default = []
}

variable "cert_keys" {
  type    = list(string)
  default = []
}
