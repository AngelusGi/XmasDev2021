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
