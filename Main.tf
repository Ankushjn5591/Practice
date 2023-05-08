provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "rg" {
  name = "ankushrg"
  location ="West Europe"
}

