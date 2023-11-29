terraform {
  required_providers {
  }
  backend "azurerm" {
    resource_group_name  = "tf_state_daniel"
    storage_account_name = "terraformcoursedaniel"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}
