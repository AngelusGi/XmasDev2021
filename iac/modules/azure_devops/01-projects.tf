resource "azuredevops_project" "public" {
  name            = var.project_name
  description     = "${var.project_name} Demo Project"
  visibility      = "public"
  version_control = "Git"

  features = {
    testplans = "disabled"
    artifacts = "disabled"
  }
}

resource "azuredevops_project" "private" {
  name            = "${var.project_name} Private"
  description     = "${var.project_name} Private Project"
  visibility      = "private"
  version_control = "Git"
}
