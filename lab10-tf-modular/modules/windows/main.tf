resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_availability_set" "windows_av_set" {
  name                         = var.windows_av_set
  location                     = var.location
  resource_group_name          = var.resource_group
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
  depends_on = [
    azurerm_resource_group.resource_group,
  ]

}

resource "azurerm_windows_virtual_machine" "vmwindows" {
  name                  = each.key
  for_each              = var.windows_name
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  availability_set_id   = azurerm_availability_set.windows_av_set.id
  computer_name         = each.key
  size                  = each.value
  admin_username        = var.windows_admin_user
  admin_password        = var.admin_password

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.wos_disk_attr["wos_disk_caching"]
    storage_account_type = var.wos_disk_attr["wos_storage_account_type"]
    disk_size_gb         = var.wos_disk_attr["wos_disk_size"]
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = "latest"
  }

}

resource "azurerm_network_interface" "windows_nic" {
  for_each = var.windows_name
  name     = "${each.key}-nic"

  location            = var.location
  resource_group_name = var.resource_group

  depends_on = [
    azurerm_resource_group.resource_group,
    #module.network.vnet_info,
  ]


  ip_configuration {
    name                          = each.key
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_public_ip" "windows_pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Dynamic"
  depends_on = [
    azurerm_resource_group.resource_group,
  ]


}
