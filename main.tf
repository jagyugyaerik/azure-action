provider "azurerm" {
  features {}
}

resource "azurerm_resourge_group" "this" {
  name     = "rg-action-test"
  location = "westeurope"
}