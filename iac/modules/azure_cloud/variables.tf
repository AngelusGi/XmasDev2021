variable "project_name" {
  type     = string
  nullable = false
}

variable "admin_username" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "admin_password" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "tags" {
  description = "Map of the tags to use for the resources that are deployed"
  type        = map(string)
}

variable "sp_obj_id" {
  type     = string
  nullable = false
}

variable "vm_sku" {
  type     = string
  nullable = false
  default  = "Standard_B1s"
}
