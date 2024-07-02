terraform {
  required_version = ">=1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "ericsantosterraformstate"
    container_name       = "container-terraform"
    key                  = "azure-vm-remote-modules/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "5.3.0"

  resource_group_name     = azurerm_resource_group.resource_group.name
  use_for_each            = true
  resource_group_location = var.location
  vnet_name               = "vnet-${var.environment}"
  subnet_names            = ["subnet-${var.environment}"]
  tags                    = local.common_tags
}
