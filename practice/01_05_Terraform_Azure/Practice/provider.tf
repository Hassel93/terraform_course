terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf_state_{surname}"
    storage_account_name = "terraformcourse"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
}