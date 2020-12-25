output "VirtualNetworkInfo" {
  value = azurerm_virtual_network.vnet.address_space
}

output "SubnetInfo" {
  value = azurerm_subnet.subnet.address_prefixes
}
