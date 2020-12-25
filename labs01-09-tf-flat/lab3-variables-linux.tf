variable "avs" {
  default = "linux_avs"
}

variable "linux_name" {
  default = "lab-db1-u-vm"
}

variable "vm_size" {
  default = "Standard_B1ms"
}

variable "linux_admin_user" {
  default = "devopsadm"
}

variable "pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCFJF32ahDsGfqqcorH0A45hBQ3pdwZj8AmlBE+lgGbBjh3OY9dnPAyUUlHkRlQXMKnMGLOMfli0DDW48QErLVoRrJ6+v28xxZv/xEDnUEf8MV0xRn22qJNFcGMcDj8xXFC46/TY0gKqxBNhh8r9MczbAzVERWrRT5sKV2eOllhw651y7W0YRbVWEJxCRJr4Uuza0tvh54v2/17tlgoxmBi1O5cPyBHiz+33bciciSU7eQ0q5MU1N3Tto072RIOzPWHKPej3drOfQmCTIX8v/C6zloXtYsPGq8WwmqRi+k2MK7Lboxd2YXaqjNZW4F0RUnPkXU5Z9dm5ZkRXiOtgPvCk18nOzZyhPiErUHAQUk0k9QXyDnbHGvezHqEKfyP8m5myBh9SiTc3NQPWJ0nPQayztj82BL1p8MHbZMYHWEPpCXbg30v7tg9BKqQnLga9oVaMRCZFTr8zljTLHotRky8SN637e2u+Vur1sQEA/Iy+QSguLzfonIiTkzhBp2nMc= devopsadm@terraform.example.com"
}

variable "los_disk_attr" {
  type = map(string)
  default = {
    los_storage_account_type = "Premium_LRS"
    los_disk_size            = "32"
    los_disk_caching         = "ReadWrite"
  }
}

# Variables for marketplace OS image to be installed in the VMs. Run "az vm image list --all | grep -i <ubuntu|sles|windows|rhel|centos> os.out". Review os.out and find publisher, offer, sku, and version information and set the variables.

variable "linux_publisher" {
  default = "Canonical"
}

variable "linux_offer" {
  default = "UbuntuServer"
}

variable "linux_sku" {
  default = "18.04-LTS"
}

variable "linux_version" {
  default = "18.04.202009080"
}
