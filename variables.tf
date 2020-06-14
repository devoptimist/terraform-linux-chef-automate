################ connection ###########################

variable "ips" {
  description = "A list of ips to install chef automate on"
  type        = list(string)
}

variable "instance_count" {
  description = "The number of automate instances being created"
}

variable "ssh_user_name" {
  description = "The ssh user name used to access the ip addresses provided"
  type        = string
}

variable "ssh_user_pass" {
  description = "The ssh user password used to access the ip addresses (either ssh_user_pass or ssh_user_private_key needs to be set)"
  type        = string
  default     = ""
}

variable "ssh_user_private_key" {
  description = "The ssh user key used to access the ip addresses (either ssh_user_pass or ssh_user_private_key needs to be set)"
  type        = string
  default     = ""
}

variable "timeout" {
  description = "The timeout to wait for the connection to become available. Should be provided as a string like 30s or 5m. Defaults to 5 minutes."
  type        = string
  default     = "5m"
}

################# policyfile module ###################

variable "cookbooks" {
  description = "the cookbooks used to deploy chef automate"
  default = {
    "chef_automate_wrapper" = "github: 'srb3/chef_automate_wrapper', tag: 'v0.1.9-20200325182617'",
    "chef-ingredient" = "github: 'srb3/chef-ingredient', branch: 'products'"
  }
}

variable "runlist" {
  description = "The chef run list used to deploy chef automate"
  type        = list(string)
  default     = ["chef_automate_wrapper::default"]
}

variable "policyfile_name" {
  description = "The name to give the resulting policy file"
  type        = string
  default     = "chef_automate"
}

################ attribute json #####################

variable "data_source_script_path" {
  description = "The location of the automate data source script"
  type        = string
  default     = "/var/tmp/chef_automate_details.sh"
}

variable "channel" {
  description = "The chef install channel to use for the chef automate"
  type        = string
  default     = "current"
}

variable "products" {
  description = "The products you want to install with chef automate"
  type        = list
  default     = ["automate"]
}

variable "install_version" {
  description = "The version of chef automate to install"
  type        = string
  default     = "latest"
}

variable "config" {
  description = "Any extra config that needs to be passed to the automate server can be placed in this string"
  type        = string
  default     = ""
}

variable "accept_license" {
  description = "Shall we accept the chef product license"
  type        = bool
  default     = true
}

variable "json_credentials_path" {
  description = "The path to write the automate credentials to"
  type        = string
  default     = "/tmp/automate-credentials.json"
}

variable "data_collector_token" {
  description = "The token used to access the data collector end point"
  type        = string
  default     = ""
}

variable "hostname_method" {
  description = "The method to use for choosing a hostname"
  type        = string
  default     = "ipaddress"
}

variable "admin_password" {
  description = "Sets the automate admin password"
  type        = string
  default     = ""
}

variable "chef_automate_license" {
  description = "The automate license string if you have purchased a chef automate license"
  type        = string
  default     = ""
}

variable "fqdns" {
  description = "A list of fully qualified host names to apply to each automate server being created"
  type        = list(string)
  default     = []
}

variable "certs" {
  description = "A list of ssl certificates to apply to each automate server"
  type        = list(string)
  default     = []
}

variable "cert_keys" {
  description = "A list of ssl private keys to apply to each automate server"
  type        = list(string)
  default     = []
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on"
  type        = list(any)
  default     = []
}
