terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.82.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e487eea4-bf90-4078-8e59-5ea37a83c68b"
}

provider "azuread" {
  # Configuration options
}