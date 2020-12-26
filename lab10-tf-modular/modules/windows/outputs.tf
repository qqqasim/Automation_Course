output "Windows_hostnames" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].name
}

output "Windows_private_ip_addresses" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].private_ip_address
}

output "Windows_public_ip_addresses" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].public_ip_address
}
