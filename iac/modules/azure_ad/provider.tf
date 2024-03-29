terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.12.0"
    }
  }
}

provider "azuread" {
  tenant_id = var.tenant_id
}
