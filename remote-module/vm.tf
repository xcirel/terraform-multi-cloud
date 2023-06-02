resource "azurerm_resource_group" "resource_group" {
  name     = "remote_module"
  location = var.location

  tags = local.common_tags
}
