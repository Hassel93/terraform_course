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
  backend "azurerm" {
    resource_group_name  = "tf_state_{surname}"
    storage_account_name = "terraformcourse"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "ee601051-87dc-4044-bd7d-4f174dd33719"
}