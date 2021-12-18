resource "azuredevops_user_entitlement" "user" {
  principal_name       = var.username
  account_license_type = var.license
}
