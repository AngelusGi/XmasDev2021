resource "azurerm_role_assignment" "rbac" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = var.sp_obj_id
}
