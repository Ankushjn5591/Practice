provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "rg" {
  name = "ankushrg"
  location = "East US"
}

data "azurerm_key_vault" "key" {
  name         = "firstkeyvault5591"
}

data "azurerm_key_vault_secret" "keysecret" {
  name         = "storagekey"
  key_vault_id = azurerm_key_vault.key.id
}

output "example_secret_value" {
  value = data.azurerm_key_vault_secret.example.value
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Storagerg"
    storage_account_name = "storageaccount5591"
    container_name       = "tfstate"
    key                  = "devpipeline.terraform.tfstate"
    access_key           = "${output.exmaple_secret_value.value}"
  }
}