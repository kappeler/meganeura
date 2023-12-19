# Define Terraform provider
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "mn-tfstate-rg"
    storage_account_name = "mntfstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}
# Configure the Azure provider
provider "azurerm" {
  features {}
}


resource "meganeura-rg" "example" {
  name     = "example"
  location = "switzerlandnorth"
}