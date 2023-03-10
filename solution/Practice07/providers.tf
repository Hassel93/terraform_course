terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.36.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf_state_daniel"
    storage_account_name = "terraformcoursedaniel"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}

provider "azuread" {
  # Configuration options
}

provider "random" {
  # Configuration options
}