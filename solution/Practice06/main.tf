locals {
  app_name = "app${var.test_variable}"
  location = var.test_variable == "test" ? "switzerlandnorth" : "eu-west"
}

resource "azurerm_resource_group" "rg_example" {
  name     = local.app_name
  location = local.location
}

resource "azurerm_storage_account" "st_example" {
  name                     = "sto${local.app_name}"
  resource_group_name      = azurerm_resource_group.rg_example.name
  location                 = azurerm_resource_group.rg_example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}