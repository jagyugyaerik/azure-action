provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-action-tfstate"
  location = "westeurope"
}