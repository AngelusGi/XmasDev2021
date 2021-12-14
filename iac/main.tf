################
# Modules      #
################

module "az_devops" {
  source       = "./modules/azure_devops/"
  project_name = var.project_name
  url          = var.url
  pat          = var.pat
  username     = var.username
  devops_license = var.devops_license
  # droplet_count = 3
  # group_name    = "group1"
}

# output "loadbalancer-ip" {
#   value = module.groups.lb_ip
# }

################
# Variables    #
################

variable "project_name" {
}

variable "url" {
}

variable "pat" {
}

variable "username" {
}

variable "devops_license" {
}
