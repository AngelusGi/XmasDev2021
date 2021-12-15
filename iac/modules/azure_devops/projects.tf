resource "azuredevops_project" "devops_project_public" {
  name        = var.project_name
  description = join(" ", ["Demo", var.project_name])
  visibility  = "public"
}

resource "azuredevops_project" "devops_project_private" {
  name            = join(" ", [var.project_name, "Private"])
  description     = join(" ", ["Demo", var.project_name, "Private Project"])
  visibility      = "private"
  version_control = "Git"
}
