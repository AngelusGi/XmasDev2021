################
# Modules      #
################

module "data" {
  source = "./modules/data/"
}

module "aad" {
  source = "./modules/azure_ad/"

  tenant_id = module.data.tenant_id

}

module "az" {
  source = "./modules/azure_cloud/"

  project_name = var.project_name

  admin_password = var.admin_password
  admin_username = var.admin_username

  az_region = var.az_region

  sp_obj_id        = module.aad.az_sp_obj_id
  sp_client_secret = module.aad.az_sp_key
  sp_client_id     = module.aad.az_sp_id

  tenant_id = module.data.tenant_id
  az_sub_id = module.data.az_sub_id

  tags = var.tags
}

module "az_devops" {
  source       = "./modules/azure_devops/"
  project_name = var.project_name
  url          = var.url
  devops_pat   = var.devops_pat
  github_pat   = var.github_pat
  username     = var.username
  license      = var.license

  az_sp_id  = module.aad.az_sp_id
  az_sp_key = module.aad.az_sp_key

  az_sub_id   = module.data.az_sub_id
  az_sub_name = module.data.az_sub_name

  az_acr_pwd  = module.az.acr_pwd
  az_acr_url  = module.az.acr_url
  az_acr_user = module.az.acr_admin

  tenant_id = module.data.tenant_id
}

################
# Outputs      #
################

output "aad_az_sp_id" {
  value     = module.aad.az_sp_id
  sensitive = true
}

# output "aad_az_sp_key" {
#   value = module.aad.az_sp_key
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

variable "admin_username" {
  sensitive = true
}

variable "admin_password" {
  sensitive = true
}

variable "tags" {
}

variable "vm_sku" {
}

variable "az_region" {
}

variable "license" {
}
