
module "resource_group" {
  source = "../../modules/azurerm_resource_groups"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "virtual_network" {
  source = "../../modules/azurerm_virtual_networks"

  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

module "subnets" {
  source   = "../../modules/azurerm_subnets"
  for_each = var.subnets

  subnet_name          = each.key
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.vnet_name
  address_prefixes     = each.value
}


module "network_security_groups" {
  source   = "../../modules/azurerm_network_security_groups"
  for_each = var.nsg_config

  nsg_name            = each.value.nsg_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.subnets[each.key].subnet_id
  security_rules      = each.value.security_rules
  tags                = var.tags
}


module "frontend_public_ip" {
  source = "../../modules/azurerm_public_ips"

  public_ip_name     = "nextops-frontend-pip"
  location           = var.location
  resource_group_name = module.resource_group.resource_group_name

  tags = var.tags
}


module "frontend_vm" {
  source = "../../modules/azurerm_virtual_machines"

  vm_name            = "nextops-frontend-vm"
  location           = var.location
  resource_group_name = module.resource_group.resource_group_name

  subnet_id   = module.subnets["frontend"].subnet_id
  public_ip_id = module.frontend_public_ip.public_ip_id

  vm_size             = var.vm_size
  admin_username      = var.admin_username

  admin_password = var.admin_password

  tags = var.tags
}

module "backend_vm" {
  source = "../../modules/azurerm_virtual_machines"

  vm_name            = "nextops-backend-vm"
  location           = var.location
  resource_group_name = module.resource_group.resource_group_name

  subnet_id = module.subnets["backend"].subnet_id

  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password = var.admin_password

  tags = var.tags
}

