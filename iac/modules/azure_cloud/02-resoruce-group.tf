resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.az_region
  tags     = var.tags
}
