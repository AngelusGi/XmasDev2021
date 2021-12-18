terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.89.0"
    }
  }
}

provider "azurerm" {
  client_id       = var.sp_client_id
  client_secret   = var.sp_client_secret
  subscription_id = var.az_sub_id
  tenant_id       = var.tenant_id

  features {
  }
}
