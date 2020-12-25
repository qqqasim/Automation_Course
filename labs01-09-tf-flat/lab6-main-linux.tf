resource "azurerm_availability_set" "avset" {
  name                = var.avs
  location            = var.location
  resource_group_name = var.rg2
depends_on = [
        azurerm_resource_group.rg2
]

}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  name                  = "${var.linux_name}-vm"
  location              = var.location
  resource_group_name   = var.rg2
  network_interface_ids = [azurerm_network_interface.linux_nic.id]
  availability_set_id   = azurerm_availability_set.avset.id
  computer_name         = var.linux_name
  size                  = var.vm_size
  admin_username        = var.linux_admin_user
  tags                  = local.common_tags
  lifecycle {
    #prevent_destroy = true
    ignore_changes = [tags, ]
  }

  depends_on = [
    azurerm_availability_set.avset,
  ]


  admin_ssh_key {
    username   = var.linux_admin_user
    public_key = var.pub_key
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk"
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
  name = "${var.linux_name}-nic"

  location            = var.location
  resource_group_name = var.rg2
  tags                = local.common_tags


  ip_configuration {
    name                          = "${var.linux_name}-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.linux_pip.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_public_ip" "linux_pip" {
  name                = "${var.linux_name}-pip"
  location            = var.location
  resource_group_name = var.rg2
  allocation_method   = "Dynamic"
  tags                = local.common_tags

}

