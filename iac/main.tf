################
# Modules      #
################

module "aad" {
  source = "./modules/azure_ad/"

  tenant_id = var.tenant_id
}

module "az_devops" {
  source         = "./modules/azure_devops/"
  project_name   = var.project_name
  url            = var.url
  devops_pat     = var.devops_pat
  github_pat     = var.github_pat
  username       = var.username
  devops_license = var.devops_license

  az_sp_id  = module.aad.aad_az_sp_id
  az_sp_key = module.aad.aad_az_sp_key

  az_sub_id   = var.az_sub_id
  az_sub_name = var.az_sub_name

  tenant_id = var.tenant_id
}

################
# Outputs      #
################

output "aad_az_sp_id" {
  value     = module.aad.aad_az_sp_id
  sensitive = true
}

# output "aad_az_sp_key" {
#   value = module.aad.aad_az_sp_key
#   sensitive = true
# }

################
# Variables    #
################

variable "project_name" {
}

variable "url" {
}

variable "devops_pat" {
  sensitive = true
}

variable "github_pat" {
  sensitive = true
}

variable "username" {
}

variable "devops_license" {
}

variable "tenant_id" {
  sensitive = true
}

variable "az_sub_id" {
  sensitive = true
}

variable "az_sub_name" {
  sensitive = true
}
