
output "vnet_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_address_space" {
  description = "VNet address space"
  value       = azurerm_virtual_network.vnet.address_space
}
