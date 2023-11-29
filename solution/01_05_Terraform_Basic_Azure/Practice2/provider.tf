terraform {
  backend "azurerm" {
    resource_group_name  = "rg_state_daniel"
    storage_account_name = "tfstateterraformdaniel"
    container_name       = "container"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "ee601051-87dc-4044-bd7d-4f174dd33719"
}