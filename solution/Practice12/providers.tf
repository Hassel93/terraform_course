terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.47.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf_state_daniel"
    storage_account_name = "terraformcoursedaniel"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

provider "azurerm" {
  alias = "daniel_sub"
  subscription_id = "6d7a3341-6e8e-4beb-9800-ca14db2d409a"
  features {}
}