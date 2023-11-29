resource "random_integer" "id" {
  min = 1
  max = 500
}

resource "azurerm_resource_group" "rg" {
  location = "switzerlandnorth"
  name     = "rg-${Hier sollte eine Variable stehen}-${random_integer.id.result}"
}


resource "azurerm_storage_account" "storagaeaccount" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 =  azurerm_resource_group.rg.name
  name                     = "stoterraform${random_integer.id.result}"
  resource_group_name      = azurerm_resource_group.rg.name
}