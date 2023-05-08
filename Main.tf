provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "rg" {
  name = "ankushrg"
  location = "East US"
}

data "azurerm_resource_group" "rg1" {
  name         = "keyvaultrg"
}
data "azurerm_key_vault" "key" {
  name         = "firstkeyvault5591"
  resource_group_name = data.azurerm_resource_group.rg1.name
}


data "azurerm_key_vault_secret" "storage_access_key" {
  name         = "storagekey"
  key_vault_id = data.azurerm_key_vault.key.id
}


  
