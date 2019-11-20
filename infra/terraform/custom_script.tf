resource "azurerm_virtual_machine_extension" "vm_cse" {
    count = "${length(var.no_of_subnets)}"
    name = "install_ansible"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    virtual_machine_name = "${element(azurerm_virtual_machine.vm.*.name, count.index)}"
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.1"
    auto_upgrade_minor_version = true

    settings = <<SETTINGS
    {
        "commandToExecute": "sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-add-repository ppa:ansible/ansible && sudo apt-get update -y && sudo apt-get install ansible --yes && sudo ansible --version"
    }
    SETTINGS
}