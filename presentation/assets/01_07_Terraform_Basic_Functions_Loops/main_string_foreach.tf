locals {
  participants = 
  [
    "rolf",
    "manuel",
    "gianluca",
    "wolfgang",
    "matthias",
    "daniel"
  ]
  
  teacher = ["daniel"]
  
  participants_with_uppercase = [
    for participant in local.participants : upper(participant) if contains(local.teacher, participant) == false
  ]

}


data "ad_user" "participants" {
  for_each = toset(local.participants_with_uppercase)
  user_id = each.value # each.key is the same
}

resource "azurerm_resource_group" "rg" {
  location = "switzerlandnorth"
  name     = "rg-participients"
}

resource "azurerm_storage_account" "storagaeaccount" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = "switzerlandnorth"
  name                     = "stoparticipants"
  resource_group_name      = azurerm_resource_group.rg.name
}

resource "azurerm_storage_container" "stcontainer" {
  count = length(local.participants_with_uppercase)
  name                  =  local.participants_with_uppercase[count.index]
  storage_account_name  = azurerm_storage_account.storagaeaccount.name
  container_access_type = "blob"
}

