resource "azuredevops_user_entitlement" "devops_user" {
  principal_name = var.username
  account_license_type = var.devops_license
}
