
output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "subnet_id" {
  value = azurerm_subnet_network_security_group_association.association.subnet_id
}
