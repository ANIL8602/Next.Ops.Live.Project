
module "resource_group" {
  source = "../../modules/azurerm_resource_groups"

  resource_group_name = var.resource_group_name
  location            = var.location


  tags = var.tags

}
