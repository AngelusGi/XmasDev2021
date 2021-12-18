resource "azuredevops_project" "library" {
  name = "${var.project_name}-library"
}

resource "azuredevops_variable_group" "variablegroup" {
  project_id   = azuredevops_project.public.id
  name         = "${var.project_name} Variable Group"
  description  = "ACR and dynamics values"
  allow_access = true

  variable {
    name  = "project_name"
    value = var.project_name
  }

  variable {
    name  = "agent_pool_name"
    value = data.azuredevops_agent_pool.pool.name
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
