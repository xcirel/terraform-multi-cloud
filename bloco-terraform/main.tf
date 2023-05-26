terraform {
  required_version = "~>1.0.0" # 1.0.0 until 1.0.n

  required_providers {
    aws = {
        version = "!=3.0"
        source = "hashicorp/aws"
    }
    azurerm = {
        version = "3.0.0"
    }
  }

  backend "azurerm" {
    
  }
}

