################ connection ###########################

variable "ip" {
  description = "An ip address to install chef automate on"
  type        = string
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

variable "tmp_path" {
  description = "A path to stage files and config"
  type        = string
  default     = "/var/tmp"
}

################# effortless settings ############

variable "automate_effortless_package" {
  description = "The name of the chef automate effortless package"
  type        = string
  default     = "srb3/chef_automate_wrapper/0.1.9/20200924080756"
}

################ attribute json #####################

variable "data_source_script" {
  description = "The name of the automate data source script"
  type        = string
  default     = "chef_automate_details.sh"
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

variable "ingest_token" {
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

variable "fqdn" {
  description = "A fully qualified host name to apply to the automate server"
  type        = string
  default     = ""
}

variable "cert" {
  description = "An ssl certificate to apply the automate server"
  type        = string
  default     = ""
}

variable "cert_key" {
  description = "An ssl private key to apply to the automate server"
  type        = string
  default     = ""
}

variable "patching_override_origin" {
  description = "If you want to deploy your own patches to chef automate put your habitat origin here"
  type        = string
  default     = "chef"
}

variable "patching_hartifacts_path" {
  description = "The location to configure chef automate to look for patches"
  type        = string
  default     = "/hab/results"
}

variable "proxy_string" {
  description = "If needed set a proxy server details in this variable"
  type        = string
  default     = ""
}

variable "no_proxy_string" {
  description = "If needed set the no_proxy details in this variable"
  type        = string
  default     = ""
}

############ consul settings #####################

variable "consul_datacenter" {
  description = "The name of the datacenter to use for consul"
  type        = string
  default     = "dc1"
}

variable "consul_port" {
  description = "The port number to use for consul"
  type        = string
  default     = "8500"
}

variable "consul_log_level" {
  description = "The log level to run the consul service as"
  type        = string
  default     = "info"
}
