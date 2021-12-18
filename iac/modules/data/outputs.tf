data "azurerm_subscription" "current" {
}

output "tenant_id" {
  value = data.azurerm_subscription.az_sub.id
}
