resource "azuredevops_git_repository" "devops_repo_public" {
  depends_on = [
    azuredevops_git_repository.devops_repo_public_empty
  ]
  project_id = azuredevops_project.devops_project_public.id
  name       = join("-", [azuredevops_project.devops_project_public.name, "public", "repo"])
  initialization {
    # init_type = "Clean"
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/AngelusGi/XmasDev2021"
  }
}

resource "azuredevops_git_repository" "devops_repo_public_empty" {
  depends_on = [
    azuredevops_git_repository.devops_repo_public_empty
  ]
  project_id = azuredevops_project.devops_project_public.id
  name       = join(" ", [azuredevops_project.devops_project_public.name, "public", "empty", "repo"])
  initialization {
    init_type = "Clean"
  }
}


# resource "azuredevops_git_repository" "devops_repo_private" {
#   depends_on = [
#     azuredevops_project.devops_project_private,
#     azuredevops_serviceendpoint_github.devops_github_sc
#     # azuredevops_serviceendpoint_generic_git.devops_github_sc
#   ]
#   project_id = azuredevops_project.devops_project_private.id
#   name       = join("-", [azuredevops_project.devops_project_private.name, "private", "repo"])

#   initialization {
#     init_type   = "Import"
#     source_type = "Git"
#     service_connection_id = azuredevops_serviceendpoint_github.devops_github_sc.id
#     source_url  = "https://github.com/AngelusGi/LearnTerraform.git"
#   }
# }
