resource "azurerm_resource_group" "first_resource_group_iac" {
  name     = "storage_account_resource_group"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "first_storage_account_iac" {
  name                     = "ericsantosstorageaccount"
  resource_group_name      = azurerm_resource_group.first_resource_group_iac.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = local.common_tags
  }
}

resource "azurerm_storage_container" "first_container_iac" {
  name                  = ""
  storage_account_name  = azurerm_storage_account.first_storage_account_iac.name
}