variable "project_name" {
  type = string
}

variable "admin_username" {
  type      = string
  sensitive = true
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  description = "Map of the tags to use for the resources that are deployed"
  type        = map(string)
}

variable "sp_name" {
  type = string
}

variable "sp_role" {
  type = string
}

variable "vm_sku" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "az_sub_id" {
  type = string
}

variable "az_region" {
  type = string
}
