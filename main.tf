resource "null_resource" "delete_tags" {
#   depends_on = [
#     azuread_application.app,
#     azuread_service_principal.app,
#     azuread_group.group
#   ]

#   triggers = {
#     resource_group_name = module.caf.resource_groups[local.default_resource_group_key].name
#   }

  provisioner "local-exec" {
    command     = format("%s/scripts/HelloWorld.ps1", path.module)
    interpreter = ["/bin/pwsh", "-Command"]
    on_failure  = fail
  }

}