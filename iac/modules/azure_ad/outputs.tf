output "az_sp_id" {
  description = "Service Principal ClientId for Azure DevOps Service Connection (AzureRM)"
  sensitive   = true
  value       = azuread_application.sp_devops.application_id # ClientId
}

output "az_sp_key" {
  description = "Service Principal Secret for Azure DevOps Service Connection (AzureRM)"
  sensitive   = true
  value       = azuread_application_password.sp_devops.value # ClientSecret
}

output "az_sp_obj_id" {
  description = "Service Principal ObjectId for Azure DevOps Service Connection (AzureRM)"
  sensitive   = true
  value       = azuread_application_password.sp_devops.application_object_id # ObjectId
}

output "az_sp_name" {
  description = "Service Name for Azure DevOps Service Connection (AzureRM)"
  sensitive   = false
  value       = azuread_application_password.sp_devops.display_name # DispalyName
}
