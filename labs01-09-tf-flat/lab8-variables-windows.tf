variable "windows_name" {
  type = map(string)
  default = {
    lab-app1-w-vm1 = "Standard_B1ms"
    lab-app1-w-vm2 = "Standard_D2s_v3"
  }
}
variable "windows_av_set" {
  default = "windows-avs"
}

variable "windows_admin_user" {
  default = "winadm"
}

variable "admin_password" {
  default = "Winadm!23"
}

# Variables for OS disk

variable "wos_disk_attr" {
  type = map(string)

  default = {
    wos_storage_account_type = "StandardSSD_LRS"
    wos_disk_size            = "127"
    wos_disk_caching         = "ReadWrite"
  }
}

# Variables for OS image to be installed in the VM. Run "az image list --all | grep -i windows > win.out" and find publisher, offer, sku, and version to be used here.

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2016-Datacenter"
}

variable "windows_version" {
  default = "latest"
}
