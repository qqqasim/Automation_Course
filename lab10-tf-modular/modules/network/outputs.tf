output "resource_group" {
  value = azurerm_resource_group.resource_group
}

output "vnet_info" {
  value = azurerm_virtual_network.vnet.address_space
}
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
output "subnet_info" {
  value = azurerm_subnet.subnet.address_prefixes
}
output "subnet_name" {
  value = azurerm_subnet.subnet.name
}
output "subnet_ids" {
  value = azurerm_subnet.subnet.id
}
