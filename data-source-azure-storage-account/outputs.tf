output "sas_token" {
    description = "SAS token for container of images"
  value = data.azurerm_storage_account_blob_container_sas.sas_token.sas
}

output "container_url" {
    description = "URL of container of images"
    value = azurerm_storage_container.container.id
}