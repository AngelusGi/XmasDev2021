resource "azurerm_container_registry" "az_acr" {
  depends_on = [
    azurerm_resource_group.az_rg
  ]
  name                = "${var.project_name}acr"
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = azurerm_resource_group.az_rg.location
  sku                 = "Basic"
  admin_enabled       = false
  # georeplications {
  #   location                = "westeurope"
  #   zone_redundancy_enabled = true
  #   tags                    = {}
  # }
}
