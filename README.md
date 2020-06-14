# Overview
This terraform module will deploy a chef automate to one or more servers

### Supported platform families:
 * Debian
 * SLES
 * RHEL

## Usage

```hcl

module "chef_automate" {
  source               = "devoptimist/chef-automate/linux"
  version              = "0.0.26"
  ips                  = ["172.16.0.23"]
  instance_count       = 1
  ssh_user_name        = "ec2-user"
  ssh_user_private_key = "~/.ssh/id_rsa"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|ips|A list of ip addresses where the chef automate will be installed|list|[]|no|
|instance_count|The number of instances being created|number|1|no|
|ssh_user_name|The ssh user name used to access the ip addresses provided|string||yes|
|ssh_user_pass|The ssh user password used to access the ip addresses (either ssh_user_pass or ssh_user_private_key needs to be set)|string|""|no|
|ssh_user_private_key|The ssh user key used to access the ip addresses (either ssh_user_pass or ssh_user_private_key needs to be set)|string|""|no|
|channel|The install channel to use for the chef automate package|string|current|no|
|install_version|The version of chef automate to install|string|latest|no|
|config|Any extra config that needs to be passed to the automate server can be placed in this string|string|""|no|
|accept_license|Shall we accept the chef product license|boolean|true|no|
|data_collector_token|The token used to access the data collector end point|string|""|no|
|admin_password|Sets the automate admin password|string|""|no|
|chef_automate_license|The automate license string if you have purchased a chef automate license|string|""|no|
|fqdns|A list of fully qualified host names to apply to each automate server being created|list|[]|no|
|certs|A list of ssl certificates to apply to each automate server|list|[]|no|
|cert_keys|A list of ssl private keys to apply to each automate server|list|[]|no|
