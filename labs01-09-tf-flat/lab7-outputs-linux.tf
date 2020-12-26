output "Linux_hostnames" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].name]
}

output "Linux_private_ip_addresses" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].private_ip_address]
}

output "Linux_public_ip_addresses" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].public_ip_address]
}
