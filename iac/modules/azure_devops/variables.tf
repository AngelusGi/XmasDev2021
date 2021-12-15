variable "project_name" {
  type     = string
  nullable = false
}

variable "url" {
  type     = string
  nullable = false
}

variable "devops_pat" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "username" {
  type     = string
  nullable = false
}

variable "devops_license" {
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
