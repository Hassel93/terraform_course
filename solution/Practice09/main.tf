resource "azurerm_resource_group" "rg_example" {
  name     = "terraformcourse${var.test_variable}"
  location = "switzerlandnorth"
}

resource "random_string" "name" {
  length           = 5
  special          = false
}

data "azurerm_client_config" "current" {}

data "azuread_user" "jf"{
  user_principal_name = "jean-francois.ageneau_snf.ch#EXT#@snfterraformcourse.onmicrosoft.com"
}

resource "azurerm_key_vault" "vault" {
  name                        = "examplekeyvault${random_string.name.result}"
  location                    = azurerm_resource_group.rg_example.location
  resource_group_name         = azurerm_resource_group.rg_example.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_access_policy" "dirk_access" {
  key_vault_id = azurerm_key_vault.vault.id
  object_id    = data.azuread_user.jf.object_id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  secret_permissions = [
    "Set",
    "Get",
    "Delete",
    "Purge",
    "Recover"
  ]
}

resource "azurerm_key_vault_secret" "secret" {
  name         = "test"
  value        = "test"
  key_vault_id = azurerm_key_vault.vault.id
}