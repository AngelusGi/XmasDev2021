variable "tenant_id" {
  type        = string
  description = "Azure Active Directory Tenant ID"
  sensitive   = true
}

variable "project_name" {
  type = string
}
