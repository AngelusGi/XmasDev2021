variable "project_name" {
  type = string
}

variable "url" {
  type = string
}

variable "devops_pat" {
  type      = string
  sensitive = true
}

variable "username" {
  type = string
}

variable "license" {
  type    = string
  default = "stakeholder"
}

variable "github_pat" {
  type      = string
  default   = "stakeholder"
  sensitive = true
}

variable "tenant_id" {
  sensitive = true
}

variable "az_sp_id" {
  sensitive = true
}

variable "az_sp_key" {
  sensitive = true
}

variable "az_sub_id" {
  sensitive = true
}

variable "az_sub_name" {
  sensitive = true
}

variable "az_acr_url" {
}

variable "az_acr_user" {
  sensitive = true
}

variable "az_acr_pwd" {
  sensitive = true
}

variable "az_rg_name" {
}
