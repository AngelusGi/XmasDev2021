resource "azurerm_virtual_machine_scale_set" "vmss" {
  name                = "${var.project_name}-vmss"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  upgrade_policy_mode = "Manual"
  overprovision       = false

  sku {
    name     = var.vm_sku
    tier     = "Standard"
    capacity = 0
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 32
  }

  os_profile {
    computer_name_prefix = "${var.project_name}-agent-"
    admin_username       = var.admin_username
    admin_password       = var.admin_password
    custom_data          = data.template_cloudinit_config.config.rendered
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name    = "${var.project_name}-netprof"
    primary = true

    ip_configuration {
      name      = "${var.project_name}-ipconfig"
      subnet_id = azurerm_subnet.vmss_vnet_sbt.id
      primary   = true
    }
  }

  tags = var.tags
}

resource "azurerm_network_interface" "vmss_nic" {
  name                = "${azurerm_virtual_machine_scale_set.vmss.name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.project_name}-ipconfig"
    subnet_id                     = azurerm_subnet.vmss_vnet_sbt.id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags
}
