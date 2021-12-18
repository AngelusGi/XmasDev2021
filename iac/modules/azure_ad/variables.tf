variable "tenant_id" {
  type      = string
  nullable  = false
  description = "Azure Active Directory Tenant ID"
  sensitive = true
}
