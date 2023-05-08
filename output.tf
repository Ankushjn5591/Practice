output "access_key" {
  value = data.azurerm_key_vault_secret.storage_access_key.value
  sensitive = true
}