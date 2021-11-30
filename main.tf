provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-action-test"
  location = "westeurope"
}