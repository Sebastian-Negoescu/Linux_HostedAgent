resource "azurerm_app_service" "webapp" {
    name = "${var.env}-${var.pip_dns}-portal"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    location = "${var.location}"
    app_service_plan_id = "${azurerm_app_service_plan.asp.id}"

    site_config {
        always_on = true
    }

}

output "webapp_hostname" {
    value = "${azurerm_app_service.webapp.default_site_hostname}"
}
