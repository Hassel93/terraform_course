terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
  backend "local" {
    path = "iwas.tfstate"
  }
}

provider "random" {
  # Configuration options
}

