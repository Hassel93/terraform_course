resource "azurerm_resource_group" "rg" {
  location = "switzerlandnorth"
  name     = "terraformcoursedaniel"
}


resource "azurerm_storage_account" "storagaeaccount" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 =  azurerm_resource_group.rg.name
  name                     = "stoterraformdaniel"
  resource_group_name      = azurerm_resource_group.rg.name
}