resource "azuredevops_serviceendpoint_azurerm" "azure_sc" {
  project_id            = azuredevops_project.public.id
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
