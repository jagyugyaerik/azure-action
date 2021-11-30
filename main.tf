provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-action-placeholder"
  location = "westeurope"
}