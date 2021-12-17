# resource "azurerm_virtual_network" "az_vnet" {
#   depends_on = [
#     azurerm_resource_group.az_rg
#   ]
#   name                = join("-", [var.project_name, "vnet"])
#   address_space       = ["192.168.5.0/24"]
#   location            = azurerm_resource_group.az_rg.location
#   resource_group_name = azurerm_resource_group.az_rg.name
# }

# resource "azurerm_subnet" "az_sbt" {
#   depends_on = [
#     azurerm_virtual_network.az_vnet
#   ]
#   name                 = join("-", [var.project_name, "sbt"])
#   resource_group_name  = azurerm_resource_group.az_rg.name
#   virtual_network_name = azurerm_virtual_network.az_vnet.name
#   address_prefixes     = ["192.168.5.0/25"]
# }

# resource "azurerm_network_interface" "az_nic" {
#   depends_on = [
#     azurerm_subnet.az_sbt
#   ]
#   name                = join("-", [var.project_name, "nic"])
#   location            = azurerm_resource_group.az_rg.location
#   resource_group_name = azurerm_resource_group.az_rg.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.az_sbt.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "az_linux_vm" {
#   depends_on = [
#     azurerm_resource_group.az_rg,
#     azurerm_virtual_network.az_vnet,
#     azurerm_network_interface.az_nic
#   ]
#   # name                = join("-", [var.project_name, "vm"])
#   name               = "agv21xmas"
#   resource_group_name = azurerm_resource_group.az_rg.name
#   location            = azurerm_resource_group.az_rg.location
#   size                = "Standard_B2s"
#   admin_username      = var.admin_username
#   admin_password      = var.admin_password
#   network_interface_ids = [
#     azurerm_network_interface.az_nic.id,
#   ]

#   disable_password_authentication = false

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#     disk_size_gb         = "30"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }

# # resource "azurerm_virtual_machine_extension" "devops_agent" {
# #   depends_on = [
# #     azurerm_linux_virtual_machine.az_linux_vm,
# #     data.azurerm_storage_account_sas.az_stg_blob_sas
# #   ]
# #   name                 = join("-", [var.project_name, "devops", "ext"])
# #   virtual_machine_id   = azurerm_linux_virtual_machine.az_linux_vm.id
# #   publisher            = "Microsoft.Azure.Extensions"
# #   type                 = "CustomScript"
# #   type_handler_version = "2.0"

# #   settings = <<SETTINGS
# #     {
# #         "fileUris": ["${data.azurerm_storage_account_sas.az_stg_blob_sas.sas}"],
# #         "commandToExecute": "sh script-sha.sh"
# #     }
# # SETTINGS
# # }
