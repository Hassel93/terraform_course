resource "azurerm_resource_group" "rg_example_1" {
  provider = azurerm.daniel_sub
  name     = "test_rg_dani_several"
  location = "switzerlandnorth"
}

resource "azurerm_resource_group" "rg_example_2" {
  provider = azurerm
  name     = "manual_test_rg_dani"
  location = "switzerlandnorth"
}