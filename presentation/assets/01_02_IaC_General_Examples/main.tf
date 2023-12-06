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
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = "switzerlandnorth"
  name     = "rg_test"
}

resource "azurerm_storage_account" "storagaeaccount" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = "switzerlandnorth"
  name                     = "storageaccountname"
  resource_group_name      = "rg_test"
}

resource "azurerm_storage_container" "stcontainer" {
  name                  = "container"
  storage_account_name  = azurerm_storage_account.storagaeaccount.name
  container_access_type = "blob"
}