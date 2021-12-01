module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.3.11"

  global_settings = {
    default_region = "region1"
    regions = {
      region1 = "southeastasia"
    }
  }
  resource_groups = {
    network = {
      name   = "vnet"
      region = "region1"
    }
  }

  compute = {
  }

  networking = {
    public_ip_addresses = var.public_ip_addresses
    vnets = {
      vnet1 = {
        resource_group_key = "network"
        vnet = {
          name          = "app-vnet"
          address_space = ["10.1.0.0/16"]
          subnets = {
          }
          app = {
            name    = "app-layer"
            cidr    = ["10.1.3.0/24"]
            nsg_key = "app"
          }
          data = {
            name    = "data-layer"
            cidr    = ["10.1.4.0/24"]
            nsg_key = "data"
          }
        }
      }
    }
  }
}

resource "null_resource" "delete_tags" {
  depends_on = [module.caf]
  #   depends_on = [
  #     azuread_application.app,
  #     azuread_service_principal.app,
  #     azuread_group.group
  #   ]

  #   triggers = {
  #     resource_group_name = module.caf.resource_groups.network.name
  #   }

  provisioner "local-exec" {
    command     = format("%s/modules/terraform-azure-psp/scripts/removeTag.ps1 -rgName ${self.triggers.resource_group_name} -tagName Module", path.module)
    interpreter = ["/bin/pwsh", "-Command"]
    on_failure  = fail
  }

}
