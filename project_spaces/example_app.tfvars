# Copyright 2021 Nordcloud Oy or its affiliates. All Rights Reserved.

####  This is an example template file  ####

##Storage Backend Details
#Backend Resource Group Name:     Name of resource group for tfstate storage account ('rg-' prefix automatically applied)
remote_backend_resource_group_name = "vo-pspbackend-tst-weu-001"

#Backend Storage Account Name:    Name of storage account for tfstate container ('st' prefix automatically applied)
remote_backend_storage_account_name = "exampleapptst001"

#Backend Storage Container Name:  Name of container name for tfstate file
remote_backend_container_name = "pspstatecontainer"

##Project Space Details

#Name of Project Space:       (STRING) Used for resource naming - REQUIRED
project_space_name = "5exampleapp"

#Environment Name:            (STRING) Environment Shortcode (tst/prd/dev/acc) - REQUIRED
environment = "tst"

#Environment Location:        (STRING) westeurope/northeurope/centralindia/westus etc. - REQUIRED
location = "westeurope"

#Location Shortcode:          (STRING) weu/neu/cei/wus etc. - REQUIRED
location_short = "weu"

##Subscription Creation
##NOTE: There are two scenarios for use of subscription data:
#1. Deployment into existing subscription: {
#Both the subscription ID and the Subscription Name of the existing subscription must be filled in
#}
#2. Deployment of a new subscription: {
#Only the Subscription Name must be filled in. The Subscription ID must be left as an empty string.
#}
#Subscription ID:             (STRING) Subscription ID for existing subscription deployment - OPTIONAL
subscription_id = "812478a5-2039-42be-a4e0-9c9833490890"

#Subscription Name:           (STRING) Subscription Name for both existing and new subscriptions - REQUIRED
subscription_name = "HH Cloud Solutions 2"

#Management group ID:         (STRING) For deployment of new subscription / also used for naming structure of TFState File - REQUIRED
management_group_id = "Internal"

##Azure AD

#AAD Application Name:        (STRING) Name of SPN to be created - OPTIONAL
aad_application_name = ""

#AAD Group Name:              (STRING) Name of AAD group to be created - OPTIONAL
aad_group_name = ""

#Resource group owner object: (STRING) Used to assign owner of resource group for an alternative object - OPTIONAL
resource_group_owner_object_id = ""

#Subscription owner object:   (STRING) Used to assign owner of subscription for an alternative object - OPTIONAL
subscription_owner_object_id = ""

##Resources

#Resource Groups:             (ARRAY) Array of additional resource groups to be created - OPTIONAL
resource_group_names = [""]

##Network

#Network Type - REQUIRED (
# "default":                Used to deploy the default networking with default NSG rules
# "disconnected":           Deploys networking with disconnected NSG rules, blocking all incoming connections
# "none":                   Does not deploy a vnet nor NSG
#)
network_type = "default"

#Peering Type - REQUIRED (
# "vwan":                   Applies virtual network connections to vWan setups
# "none":                   Deploys no peering nor virtual network connections
#)
peering_type = "vwan"

#Enable Route Table:          (BOOLEAN) Deploys an empty route table - REQUIRED
enable_route_table = true

#Virtual networks - array of virtual networks and subnets to be deployed (
  ## NOTE: If deploying multiple vnets, the subnet names must be different across vnets due to nsg naming convention
#overwrite_peering_name:    (STRING) provides an override to the peering name instead of using CAF defaults - OPTIONAL
#use_remote_gateways:       (BOOLEAN) when peering the network, whether or not to use remote gateways
#network_name:              (STRING) name of the Vnet (Naming convention automatically applied, this is for 'appname') - REQUIRED
#network_prefix:            (STRING) network address prefix for the Vnet - REQUIRED
#subnets:                   (ARRAY) array of subnets to be deployed within Vnet - REQUIRED
#name:                      (STRING) subnet name (Naming convention automatically applied, this is for 'appname') - REQUIRED
#address_prefix:            (STRING) subnet address prefix - REQUIRED
#)
virtual_networks = [
  {
    overwrite_peering_name : ""
    use_remote_gateways : false
    network_name : "exampleapp"
    network_prefix : "10.250.250.0/24"
    network_private_dns_name : "exampleapp.com"
    subnets = [
      {
        name : "ApplicationGatewaySubnet"
        address_prefix : "10.250.250.64/26"
      },
      {
        name : "AzureBastionSubnet"
        address_prefix : "10.250.250.128/26"
      }
    ]
  }
]

#Network Data - Object which contains centralised network data - REQUIRED
#firewall_ip_address:           (STRING) IP of the firewall used
#hub_name:                      (STRING) Name of the virtual hub for virtual network connections
#route_table:                   (STRING) Name of the route table used in the virtual hub
#hub_id:                        (STRING) Resource ID of the virtual hub used for virtual network connections
#dns_server_address:            (ARRAY) DNS Servers to be used on the virtual networks being deployed
#base_network_prefix:           (STRING) Full network address ranged reserved for Azure
#shared_services_vnet_prefix:   (STRING) Vnet address prefix for shared services vnet
network_data = {
  connectivity_subscription_id = "4ef8b072-bf96-4f01-87ca-25907d00b2cc"
  firewall_ip_address          = "10.180.0.132"
  hub_name                     = "vhub-vo-cn-weu-001"
  route_table                  = "defaultRouteTable"
  hub_id                       = "/subscriptions/4ef8b072-bf96-4f01-87ca-25907d00b2cc/resourceGroups/rg-vo-vwan/providers/Microsoft.Network/virtualHubs/vhub-vo-cn-weu-001"
  dns_server_address           = ["10.180.1.60", "10.180.1.61"]
  base_network_prefix          = "10.0.0.0/8"
  shared_services_vnet_prefix  = "10.180.2.0/24"
  service_endpoints = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.AzureCosmosDB",
    "Microsoft.EventHub",
    "Microsoft.KeyVault",
    "Microsoft.ServiceBus",
    "Microsoft.Sql",
    "Microsoft.Storage",
  ]
}
