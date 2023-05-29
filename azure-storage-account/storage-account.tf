resource "azurerm_resource_group" "first_resource_group_iac" {
  name     = ""
  location = ""

  tags = ""
}

resource "azurerm_storage_account" "first_storage_account_iac" {
  name                     = ""
  resource_group_name      = ""
  location                 = ""
  account_tier             = ""
  account_replication_type = ""

  tags = {
    environment = ""
  }
}

resource "azurerm_storage_container" "first_container_iac" {
  name                  = ""
  storage_account_name  = ""
}