resource "azuredevops_project" "devops_project" {
  name        = var.project_name
  description  = join(" ", ["Demo", var.project_name])
  visibility = "public"
}
