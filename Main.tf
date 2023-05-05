Provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "rg" {
  name = "${var.rgname}"
  location ="${var.rglocation}"
}

