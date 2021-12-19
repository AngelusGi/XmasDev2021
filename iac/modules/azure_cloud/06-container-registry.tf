# Resources #

resource "azurerm_container_registry" "acr" {
  name                = "${var.project_name}acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Data resources #

data "azurerm_container_registry" "acr" {
  resource_group_name = azurerm_resource_group.rg.name
  name                = azurerm_container_registry.acr.name
}
