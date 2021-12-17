resource "azurerm_resource_group" "az_rg" {
  name     = "${var.project_name}-rg"
  location = "northeurope"
}
