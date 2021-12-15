terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.8"
    }
  }
}

provider "azuredevops" {
  org_service_url       = var.url
  personal_access_token = var.devops_pat
}
