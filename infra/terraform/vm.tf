resource "azurerm_virtual_machine" "vm" {
    count = "${length(var.no_of_subnets)}"
    name = "${var.env}-vm"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    location = "${var.location}"
    network_interface_ids = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
    vm_size = "Standard_D2s_v3"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
    }
    storage_os_disk {
        name = "${var.env}_vm_datadisk"
        managed_disk_type = "Standard_LRS"
        disk_size_gb = 1024
        create_option = "FromImage"
        caching = "ReadWrite"
    }

    os_profile {
        computer_name = "${var.pip_dns}-${var.env}"
        admin_username = "${var.admin_username}"
    }
    os_profile_linux_config {
        disable_password_authentication = true

        ssh_keys {
            path = "${var.user_ssh_key_path}"
            key_data = "${var.user_ssh_key}"
        }
    }

    boot_diagnostics {
        enabled = true
        storage_uri = "${azurerm_storage_account.sa.primary_blob_endpoint}"
    }
}