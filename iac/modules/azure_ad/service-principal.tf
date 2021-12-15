#################
# Data Resource #
#################

data "azuread_client_config" "aad_current_user" {}

#################
# Data Resource #
#################

resource "azuread_application" "aad_sp_devops" {
  display_name = "aad_sp_devops_az"
  owners       = [data.azuread_client_config.aad_current_user.object_id]
}

resource "azuread_service_principal" "aad_sp_devops" {
  application_id               = azuread_application.aad_sp_devops.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.aad_current_user.object_id]
}

resource "azuread_application_password" "aad_sp_devops" {
  depends_on = [
    azuread_application.aad_sp_devops
  ]
  application_object_id = azuread_application.aad_sp_devops.object_id
  display_name          = azuread_application.aad_sp_devops.display_name
  end_date              = "2021-12-18T00:00:00Z"
  # end_date_relative = "72h"
}
