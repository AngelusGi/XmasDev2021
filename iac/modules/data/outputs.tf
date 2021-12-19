# Data rprovider #

data "azurerm_subscription" "az_sub" {
}

data "azurerm_client_config" "az_local_config" {
}

# Outputs #

output "az_sub_id" {
  description = "Azure Subscription ID"
  sensitive   = true
  value       = data.azurerm_client_config.az_local_config.subscription_id
}

output "az_sub_name" {
  description = "Azure Subscription name"
  sensitive   = true
  value       = data.azurerm_subscription.az_sub.display_name
}

output "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  sensitive   = true
  value       = data.azurerm_client_config.az_local_config.tenant_id
}
