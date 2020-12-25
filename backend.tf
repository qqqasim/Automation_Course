terraform {
  backend "azurerm" {
    resource_group_name = "tfstates-RG"
    storage_account_name = "tfstatesasghar"
    container_name       = "tfstatefiles"
    key                  = "terraformmodulestate"
  }
}
