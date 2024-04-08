terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.63.0"
    }
  }
  
  backend "s3" {
    bucket = "xcirel-terraform-remote-state"
    key    = "commands/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Owner = "xcirel"
      Managed-by = "terraform"
    }
  }
}