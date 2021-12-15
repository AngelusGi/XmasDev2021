output "aad_az_sp_id" {
  depends_on = [
    azuread_application.aad_sp_devops
  ]
  description = "Service Principal ClientId for Azure DevOps Service Connection (AzureRM)"
  sensitive   = true
  # value = azuread_application_password.aad_sp_devops.application_object_id # ObjectId
  value = azuread_application.aad_sp_devops.application_id # ClientId
}

output "aad_az_sp_key" {
  depends_on = [
    azuread_application_password.aad_sp_devops
  ]
  description = "Service Principal Secret for Azure DevOps Service Connection (AzureRM)"
  sensitive   = true
  value       = azuread_application_password.aad_sp_devops.value # ClientSecret
}
