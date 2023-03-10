resource "azurerm_resource_group" "example" {
  name     = "manual_test_rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example-1" {
  name                = "vnet_example"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.example.location
}

data "azurerm_virtual_network" "example-2" {
  provider = azurerm.daniel_sub
  name                = "testing_vnet_everyone"
  resource_group_name = "vnet_tests"
}

resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.example-1.name
  remote_virtual_network_id = data.azurerm_virtual_network.example-2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  provider = azurerm.daniel_sub
  name                      = "peer2to1"
  resource_group_name       = data.azurerm_virtual_network.example-2.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.example-2.name
  remote_virtual_network_id = azurerm_virtual_network.example-1.id
}