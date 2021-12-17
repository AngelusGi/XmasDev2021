# resource "azurerm_storage_account" "az_stg_acc" {
#   depends_on = [
#     azurerm_resource_group.az_rg
#   ]
#   name                     = join("", [var.project_name, "stg"])
#   resource_group_name      = azurerm_resource_group.az_rg.name
#   location                 = azurerm_resource_group.az_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

# }

# resource "azurerm_storage_container" "az_stg_cont" {
#   depends_on = [
#     azurerm_storage_account.az_stg_acc
#   ]
#   name                  = "content"
#   storage_account_name  = azurerm_storage_account.az_stg_acc.name
#   container_access_type = "private"
# }

# resource "azurerm_storage_blob" "az_stg_blob" {
#   depends_on = [
#     azurerm_storage_account.az_stg_acc,
#     azurerm_storage_container.az_stg_cont
#   ]
#   name                   = "script-sha.sh"
#   storage_account_name   = azurerm_storage_account.az_stg_acc.name
#   storage_container_name = azurerm_storage_container.az_stg_cont.name
#   type                   = "Block"
#   source                 = "./modules/azure_cloud/alternative/script-sha.sh"
# }

# data "azurerm_storage_account_sas" "az_stg_blob_sas" {
#   depends_on = [
#     azurerm_storage_account.az_stg_acc,
#     azurerm_storage_container.az_stg_cont,
#     azurerm_storage_blob.az_stg_blob
#   ]
#   connection_string = azurerm_storage_account.az_stg_acc.primary_connection_string
#   https_only        = true

#   resource_types {
#     service   = true
#     container = true
#     object    = true
#   }

#   services {
#     blob  = true
#     file  = false
#     queue = false
#     table = false
#   }

#   start  = "2021-12-16T17:00:00Z"
#   expiry = "2021-12-18T00:00:00Z"

#   permissions {
#     read    = true
#     list    = true
#     process = true
#     add     = false
#     create  = false
#     update  = false
#     delete  = false
#     write   = false
#   }
# }
