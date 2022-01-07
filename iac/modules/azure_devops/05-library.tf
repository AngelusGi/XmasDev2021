resource "azuredevops_variable_group" "variablegroup" {
  project_id   = azuredevops_project.public.id
  name         = "Variable Group"
  description  = "ACR and dynamics values"
  allow_access = true

  variable {
    name  = "agent_pool_name"
    value = "${var.project_name}-pool"
  }

  variable {
    name  = "az_sc_name"
    value = azuredevops_serviceendpoint_azurerm.azure_sc.service_endpoint_name
  }

  variable {
    name  = "docker_registry_sc_name"
    value = azuredevops_serviceendpoint_dockerregistry.acr_sc.service_endpoint_name
  }

  variable {
    name  = "az_rg_name"
    value = var.az_rg_name
  }

  variable {
    name  = "project_name"
    value = var.project_name
  }

  variable {
    name  = "acr_url"
    value = var.az_acr_url
  }

  variable {
    name         = "acr_user"
    secret_value = var.az_acr_user
    is_secret    = true
  }

  variable {
    name         = "acr_pwd"
    secret_value = var.az_acr_pwd
    is_secret    = true
  }
}
