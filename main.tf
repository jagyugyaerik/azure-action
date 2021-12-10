provider "azurerm" {
  features {}
}

variable "rg_id" { default = "" }
variable "rg_name" { default = "eja-named" }
variable "lc" { default = "westeurope" }

module "m1" {
  source = "./modules/m1"
  count  = var.rg_id == "" ? 1 : 0

  rg = var.rg_name
}

module "vnet" {
  source = "./modules/m2"

  vnet_name = "eja-vnet"
  rg        = var.rg
  lc        = var.lc
}

output "rg" {
    value = coalesce(try(module.m1[0].rg, ""), var.rg_id)
}