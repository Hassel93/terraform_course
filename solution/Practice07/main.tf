resource "random_string" "name" {
  length           = 5
  special          = false
}

resource "random_password" "pw" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azuread_user" "admin" {
  user_principal_name = "${random_string.name.result}@snfterraformcourse.onmicrosoft.com"
  display_name        = random_string.name.result
  mail_nickname       = random_string.name.result
  password            = random_password.pw.result
}