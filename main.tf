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

  networking = {
    vnets = {
      vnet1 = {
        resource_group_key = "network"
        vnet = {
          name          = "app-vnet"
          address_space = ["10.1.0.0/16"]
        }
        subnets = {
          app = {
            name = "app-layer"
            cidr = ["10.1.3.0/24"]
            nsg  = ""
          }
          data = {
            name = "data-layer"
            cidr = ["10.1.4.0/24"]
            nsg  = ""
          }
        }
      }
    }
  }
}


output "project_space_name" {
  value = module.caf.resource_groups.network.name
}
