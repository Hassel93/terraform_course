terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }
  backend "local" {
    path = "./t.state"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "ee601051-87dc-4044-bd7d-4f174dd33719"
}