terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.46.0"
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