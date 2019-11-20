variable "subscription_id" {
    type = "string"
    description = "Azure Subscription on which we deploy the resources."
}

variable "tenant_id" {
    type = "string"
    description = "Tenant ID for our resources."
}

variable "client_id" {
    type = "string"
    description = "Service Principal as AppID used for deployment."
}

variable "client_secret" {
    type = "string"
    description = "Service Principal secret for login."
}

######### RESOURCE RELATED ##########

variable "env" {
    type = "string"
    description = "The logical environment we're going to deploy to."
}

variable "location" {
    type = "string"
    description = "Location of the resources we are going to deploy."
    default = "West Europe"
}

variable "rg" {
    type = "string"
    description = "Resource Group's name for resources."
}

######### RESOURCES #########

variable "vnet_address" {
    type = "string"
    description = "Virtual Network address space for resources."
}

variable "subnet_prefix" {
    type = "string"
    description = "Subnet address prefix within the VNet."
}

variable "no_of_subnets" {
    type = "list"
    description = "Nombur of subnets we're going to deploy."

}
variable "pip_dns" {
    type = "string"
    description = "FQDN for the Public IP Address."
}

variable "admin_username" {
    type = "string"
    description = "Username of the Virtual Machine used for deployment."
}

variable "user_ssh_key_path" {
    type = "string"
    description = "Path to which we will authorize the user's key."
}

variable "user_ssh_key" {
    type = "string"
    description = "User's SSH Key for connection."
}