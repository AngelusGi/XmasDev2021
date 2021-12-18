output "sub_id" {
  description = "Azure Subscription ID"
  value       = data.azurerm_subscription.sub.id
  sensitive   = true
}

output "sub_name" {
  description = "Azure Subscription name"
  value       = data.azurerm_subscription.sub.display_name
}

output "acr_server" {
  description = "Azure Container Registry URL"
  value       = data.azurerm_acr_registry.acr.login_server
}

output "acr_admin" {
  description = "Azure Container Registry admin user"
  sensitive   = true
  value       = data.azurerm_client_config.admin_username
}


output "acr_pwd" {
  description = "Azure Container Registry admin password"
  value       = data.azurerm_client_config.admin_password
  sensitive   = true
}
