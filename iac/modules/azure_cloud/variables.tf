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

variable "sp_obj_id" {
  type = string
}

variable "sp_client_id" {
  type = string
}

variable "sp_client_secret" {
  type = string
}

variable "vm_sku" {
  type    = string
  default = "Standard_B1s"
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
