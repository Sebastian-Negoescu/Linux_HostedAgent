resource "azurerm_app_service_plan" "asp" {
    name = "${var.env}-ASP"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    location = "${var.location}"
    kind = "Windows"
    sku {
        tier = "Standard"
        size = "S1"
        capacity = 1
    }
}