module "network" {
  source         = "./modules/network"
  resource_group = "NetworkRG"
  location       = "canadacentral"
  vnet           = "vnet-prd"
  vnet_space     = ["10.0.0.0/16"]
  subnet         = "subnet-prd"
  subnet_space   = ["10.0.0.0/24"]
  nsg            = "prd-nsg"
}

module "linux" {
  source         = "./modules/linux"
  linux_name     = "terraform-u-vm"
  nb_count       = 1
  location       = "canadacentral"
  resource_group = "LinuxRG"
  subnet_id      = module.network.subnet_ids
}

module "windows" {
  source         = "./modules/windows"
  windows_av_set = "windows-avs"
  windows_name = {
    #terraform-w-vm1 = "Standard_B1ms"
    terraform-w-vm2 = "Standard_B1ms"
  }
  location       = "canadacentral"
  resource_group = "WindowsRG"
  subnet_id      = module.network.subnet_ids

}
