terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
    mssqlscript = {
      source = "PGSSoft/mssql"
      version = "0.6.0"
    }
  }
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "null" {
  # Configuration options
}

provider "mssqlscript" {
  hostname = "sql-datahub-store-test.public.ab513b92693d.database.windows.net"
  port     = 3342
  sql_auth = {
    username = "sqldbadmin"
    password = "izCZkrdbDQ7AnJ12"
  }
}