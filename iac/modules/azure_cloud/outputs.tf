output "acr_url" {
  description = "Azure Container Registry URL"
  value       = data.azurerm_container_registry.acr.login_server
}

output "acr_admin" {
  description = "Azure Container Registry admin user"
  sensitive   = true
  value       = data.azurerm_container_registry.acr.admin_username
}


output "acr_pwd" {
  description = "Azure Container Registry admin password"
  value       = data.azurerm_container_registry.acr.admin_password
  sensitive   = true
}
