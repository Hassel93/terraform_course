terraform {
  required_providers {
  }
  backend "local" {
    path = "terraform.tfstate"
  }
}
