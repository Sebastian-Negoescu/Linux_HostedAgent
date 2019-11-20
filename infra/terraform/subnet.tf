resource "azurerm_subnet" "subnet" {
    count = "${length(var.no_of_subnets)}"
    name = "${var.env}-subnet-${count.index}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    address_prefix = "${var.subnet_prefix}"
}

/*data "azurerm_subnet" "subnet_id" {
    name = "${azurerm_subnet.subnet[count.index].}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}*/
