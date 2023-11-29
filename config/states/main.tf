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
  subscription_id = "ee601051-87dc-4044-bd7d-4f174dd33719"
}

resource "azurerm_resource_group" "rg" {
  for_each = toset(local.participants)
  location = "switzerlandnorth"
  name     = "rg_state_${each.value}"
}

resource "azurerm_storage_account" "storagaeaccount" {
  for_each = toset(local.participants)
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = "switzerlandnorth"
  name                     = "tfstateterraform${each.value}"
  resource_group_name      = azurerm_resource_group.rg[each.value].name
}

resource "azurerm_storage_container" "stcontainer" {
  for_each = toset(local.participants)
  name                  = "container"
  storage_account_name  = azurerm_storage_account.storagaeaccount[each.value].name
  container_access_type = "blob"
}