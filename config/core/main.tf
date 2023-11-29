

resource "azurerm_resource_group" "rg" {
  location = "switzerlandnorth"
  name     = "rg_key_vault"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  location            = azurerm_resource_group.rg.location
  name                = "kv-ti8mschool-prod"
  resource_group_name = azurerm_resource_group.rg.name
  sku_name = "standard"
  enable_rbac_authorization = true
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

data "azuread_group" "member" {
  display_name     = "academymember"
  security_enabled = true
}

resource "azurerm_role_assignment" "user" {
  principal_id = data.azuread_group.member.object_id
  role_definition_name = "Owner"
  scope        = azurerm_key_vault.kv.id
}