variable "project_name" {
  type     = string
  nullable = false
}

variable "url" {
  type     = string
  nullable = false
}

variable "pat" {
  type     = string
  nullable = false
}

variable "username" {
  type     = string
  nullable = false
}

variable "devops_license" {
  type     = string
  default = "stakeholder"
}
