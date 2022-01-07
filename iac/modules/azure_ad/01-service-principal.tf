# Data #
data "azuread_client_config" "current_user" {}

# Resources #
resource "azuread_application" "sp_devops" {
  display_name = "sp_devops_az_${var.project_name}"
  owners       = [data.azuread_client_config.current_user.object_id]
}

resource "azuread_service_principal" "sp_devops" {
  application_id               = azuread_application.sp_devops.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current_user.object_id]
}

resource "azuread_application_password" "sp_devops" {
  depends_on = [
    azuread_application.sp_devops
  ]
  application_object_id = azuread_application.sp_devops.object_id
  display_name          = azuread_application.sp_devops.display_name
  # end_date              = "2021-12-18T00:00:00Z"
  end_date_relative = "720h"
}
