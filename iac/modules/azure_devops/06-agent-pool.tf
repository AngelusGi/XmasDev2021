resource "azuredevops_agent_queue" "pool" {
  project_id    = azuredevops_project.public.id
  agent_pool_id = data.azuredevops_agent_pool.pool.id
}

# Grant acccess to queue to all pipelines in the project
resource "azuredevops_resource_authorization" "auth" {
  project_id  = azuredevops_project.public.id
  resource_id = azuredevops_agent_queue.pool.id
  type        = "queue"
  authorized  = true
}

data "azuredevops_agent_pool" "pool" {
  name = "${var.project_name}-pool"
}
