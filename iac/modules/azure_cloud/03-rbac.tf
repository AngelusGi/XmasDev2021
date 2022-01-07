resource "azurerm_role_assignment" "rg_rbac" {
  scope              = azurerm_resource_group.rg.id
  role_definition_id = data.azurerm_role_definition.builtin_rbac.id
  principal_id       = data.azuread_service_principal.sp_devops.object_id
}

resource "azurerm_role_assignment" "sub_reader" {
  scope              = data.azurerm_subscription.subscription_scope.id
  role_definition_id = data.azurerm_role_definition.reader.id
  principal_id       = data.azuread_service_principal.sp_devops.object_id
}
