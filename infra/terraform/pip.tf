resource "azurerm_public_ip" "pip" {
    name = "${var.env}-pip"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    location = "${var.location}"
    sku = "Basic"
    allocation_method = "Static"
    domain_name_label = "${var.pip_dns}-${var.env}"
}

output "pip_name_value" {
  value = "${azurerm_public_ip.pip.fqdn}"
}

output "pip_cidr_value" {
    value = "${azurerm_public_ip.pip.ip_address}"
}