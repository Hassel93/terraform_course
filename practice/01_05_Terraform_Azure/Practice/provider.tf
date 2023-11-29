terraform {
  required_providers {
  }
  backend "azurerm" {
    resource_group_name  = #"tf_state_{surname}"
    storage_account_name = # "terraformcourse"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}