resource "azuredevops_git_repository" "repo_public" {
  project_id  = azuredevops_project.public.id
  description = "${var.project_name}-repo-demo"

  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/AngelusGi/pipelines-javascript-docker"
  }
}

resource "azuredevops_git_repository" "repo_private_empty" {
  project_id  = azuredevops_project.public.id
  description = "${var.project_name}-repo"

  initialization {
    init_type = "Clean"
  }
}
