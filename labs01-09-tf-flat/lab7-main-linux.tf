resource "azurerm_availability_set" "avset" {
  name                = var.avs
  location            = var.location
  resource_group_name = var.rg2
  depends_on          = [azurerm_resource_group.rg2]

}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  count                 = var.nb_count
  name                  = "${var.linux_name}${format("%1d", count.index + 1)}"
  location              = var.location
  resource_group_name   = var.rg2
  network_interface_ids = [element(azurerm_network_interface.linux_nic.*.id, count.index + 1)]
  availability_set_id   = azurerm_availability_set.avset.id
  computer_name         = "${var.linux_name}-${format("%1d", count.index + 1)}"
  size                  = var.vm_size
  admin_username        = var.linux_admin_user

  depends_on = [azurerm_availability_set.avset]

  admin_ssh_key {
    username   = var.linux_admin_user
    public_key = var.pub_key
  }

  tags = local.common_tags

  os_disk {
    name                 = "${var.linux_name}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.los_disk_attr["los_disk_caching"]
    storage_account_type = var.los_disk_attr["los_storage_account_type"]
    disk_size_gb         = var.los_disk_attr["los_disk_size"]
  }

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }

}

resource "azurerm_network_interface" "linux_nic" {
  count = var.nb_count
  name  = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"

  location            = var.location
  resource_group_name = var.rg2
  tags                = local.common_tags

  ip_configuration {
    name                 = "${var.linux_name}-ip-${format("%1d", count.index + 1)}"
    subnet_id            = azurerm_subnet.subnet.id
    public_ip_address_id = element(azurerm_public_ip.linux_pip.*.id, count.index + 1)

    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg2
  allocation_method   = "Dynamic"
  depends_on          = [azurerm_resource_group.rg2]

}

