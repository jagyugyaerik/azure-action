provider "azurerm" {
    features {}
}

resource "azurerm_resourge_group" {
    name = "rg-action-test"
    location = "westeurope"
}