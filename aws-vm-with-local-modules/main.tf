terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      version = "5.1.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "xcirel-lab-remote-state"
    key    = "aws-vm-local-modules/terraform.tfstate"
    region = "us-east-1"
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

module "network" {
  source      = "./network"
  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.1.0/24"
  environment = var.environment
}
