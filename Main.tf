provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "rg" {
  name = "${var.rgname}"
  location ="West Europe"
}

