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


data "azurerm_key_vault_secret" "storage_access_key" {
  name         = "storagekey"
  key_vault_id = data.azurerm_key_vault.key.id
}


  
