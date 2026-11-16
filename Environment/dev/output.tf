
output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vnet_name" {
  value = module.virtual_network.vnet_name
}

output "vnet_id" {
  value = module.virtual_network.vnet_id
}

output "vnet_address_space" {
  value = module.virtual_network.vnet_address_space
}


output "subnet_ids" {
  value = {
    for name, subnet in module.subnets :
    name => subnet.subnet_id
  }
}

output "subnet_names" {
  value = {
    for name, subnet in module.subnets :
    name => subnet.subnet_name
  }
}


output "nsg_ids" {
  value = {
    for name, nsg in module.network_security_groups :
    name => nsg.nsg_id
  }
}

output "nsg_names" {
  value = {
    for name, nsg in module.network_security_groups :
    name => nsg.nsg_name
  }
}



output "frontend_public_ip_name" {
  value = module.frontend_public_ip.public_ip_name
}

output "frontend_public_ip_address" {
  value = module.frontend_public_ip.public_ip_address
}



output "postgresql_server_name" {
  value = module.postgresql.postgresql_server_name
}

output "postgresql_fqdn" {
  value = module.postgresql.postgresql_fqdn
}

output "postgresql_database_name" {
  value = module.postgresql.database_name
}

