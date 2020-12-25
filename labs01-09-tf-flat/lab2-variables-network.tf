provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.40.0"
    }
  }
  required_version = "~> 0.13"
}
variable "rg2" {
  default     = "TerraformRG"
  type        = string
  description = "This resource group is to host all test infra."
}

variable "location" {
  default = "canadacentral"
}

variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  default = "network-subnet01"
}

variable "subnet_space" {
  default = ["10.0.1.0/24"]
}

variable "nsg" {
  default = "network-nsg01"
}

