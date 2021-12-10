variable "vnet_name" {}
variable "rg" {}
variable "lc" {}

resource "azurerm_network_security_group" "example" {
  name                = var.vnet_name
  location            = var.lc
  resource_group_name = var.rg
}