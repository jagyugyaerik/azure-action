variable "rg" { default = "module-generated-eja" }
variable "lc" {}

resource "azurerm_resource_group" "fk" {
  name     = var.rg
  location = var.lc
}

output "rg" {
  value = azurerm_resource_group.fk.name
}