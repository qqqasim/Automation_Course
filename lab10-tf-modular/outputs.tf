output "resource_group_name" {
  value = module.network.resource_group.name
}

output "virtual_network_name" {
  value = module.network.vnet_name
}

output "subnets" {
  value = module.network.subnet_name
}

output "Linux_hostnames" {
  value = module.linux.Linux_hostnames
}

output "Linux_private_ip_addresses" {
  value = module.linux.Linux_private_ip_addresses
}

output "Linux_public_ip_addresses" {
  value = module.linux.Linux_public_ip_addresses
}

output "Windows_hostnames" {
  value = module.windows.Windows_hostnames
}

output "Windows_private_ip_addresses" {
  value = module.windows.Windows_private_ip_addresses
}

output "Windows_public_ip_addresses" {
  value = module.windows.Windows_public_ip_addresses
}
