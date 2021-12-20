resource "azurerm_virtual_network" "vmss_vnet" {
  name                = "${var.project_name}-vnet"
  address_space       = ["192.168.60.0/24"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azurerm_subnet" "vmss_vnet_sbt" {
  name                 = "${var.project_name}-sbt"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vmss_vnet.name
  address_prefixes     = ["192.168.60.0/25"]
}
