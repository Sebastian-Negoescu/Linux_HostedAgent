resource "azurerm_network_interface" "nic" {
    count = "${length(var.no_of_subnets)}"
    name = "${var.env}-nic"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    ip_configuration {
        name = "nic-config-${count.index}"
        subnet_id = "${azurerm_subnet.subnet[count.index].id}"
        private_ip_address_allocation = "Static"
        private_ip_address = "10.0.0.4"
        public_ip_address_id = "${azurerm_public_ip.pip.id}"
    }
}

data "azurerm_network_interface" "nic_id" {
    count = "${length(var.no_of_subnets)}"
    name = "${azurerm_network_interface.nic[count.index].name}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
}
