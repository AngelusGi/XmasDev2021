resource "azuredevops_serviceendpoint_github" "devops_github_sc" {
  depends_on = [
    azuredevops_project.devops_project_private
  ]
  project_id            = azuredevops_project.devops_project_private.id
  service_endpoint_name = "GitHub"
  description           = "Service connection for GitHub - @AngelusGi - #XmasDev2021"
  auth_personal {
    personal_access_token = var.github_pat
  }
}

resource "azuredevops_serviceendpoint_azurerm" "endpointazure" {
  project_id            = azuredevops_project.devops_project_public.id
  service_endpoint_name = "AzureRM"
  description           = "Service connection to AzureRM - @AngelusGi - #XmasDev2021"
  credentials {
    serviceprincipalid  = var.az_sp_id
    serviceprincipalkey = var.az_sp_key
  }
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.az_sub_id
  azurerm_subscription_name = var.az_sub_name
}
