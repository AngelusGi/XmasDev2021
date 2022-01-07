terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.89.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.az_sub_id
  tenant_id       = var.tenant_id

  features {

  }
}
