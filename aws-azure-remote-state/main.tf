terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      version = "3.73.0"
      source  = "hashicorp/aws"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.58.0"
    }

  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "ericsantos"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}