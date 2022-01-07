data "template_file" "cloud_init" {
  template = file("${path.module}/init-vmss.yaml")
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init.rendered
  }
}

data "azuread_service_principal" "sp_devops" {
  display_name = var.sp_name
}

data "azurerm_role_definition" "builtin_rbac" {
  name = var.sp_role
}

data "azurerm_role_definition" "reader" {
  name = "Reader"
}

data "azurerm_subscription" "subscription_scope" {
}
