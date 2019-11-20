resource "azurerm_virtual_network" "vnet" {
    name = "${var.env}-vnet"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    address_space = ["${var.vnet_address}"]
}

output "vnet_space" {
    value = "${azurerm_virtual_network.vnet.address_space}"
}