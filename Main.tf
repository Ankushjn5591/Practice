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

data "azurerm_key_vault_secret" "storage_access_key"" {
  name         = "storagekey"
  key_vault_id = azurerm_key_vault.key.id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Storagerg"
    storage_account_name = "storageaccount5591"
    container_name       = "tfstate"
    key                  = "devpipeline.terraform.tfstate"
    access_key           = data.azurerm_key_vault_secret.storage_access_key.value
  }
}