resource "azurerm_storage_account" "sa" {
    name = "${var.env}sadiag"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sa_container" {
    name = "${azurerm_storage_account.sa.name}-container"
    storage_account_name = "${azurerm_storage_account.sa.name}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    container_access_type = "container"
}

output "sa_id" {
    value = "${azurerm_storage_account.sa.id}"
}