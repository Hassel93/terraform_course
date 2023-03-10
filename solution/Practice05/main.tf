resource "azurerm_resource_group" "rg_example" {
  name     = "terraformcourse"
  location = "switzerlandnorth"
}

#resource "azurerm_storage_account" "st_example" {  Bad Solution
#  name                     = "stoterraformdaniel"
#  resource_group_name      = "terraformcourse"
#  location                 = "switzerlandnorth"
#  account_tier             = "Standard"
#  account_replication_type = "GRS"
#}

resource "azurerm_storage_account" "st_example" {
  name                     = "stoterraformdaniel"
  resource_group_name      = azurerm_resource_group.rg_example.name
  location                 = azurerm_resource_group.rg_example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}