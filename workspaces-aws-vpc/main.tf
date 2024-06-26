terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      version = "5.1.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "xcirel-lab-terraform-remote-state"
    key    = "workspaces/terraform.tfstate"
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