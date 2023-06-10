terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      version = "5.1.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "ericsantos-remote-state"
    key    = "aws-vpc-for-expressions/terraform.tfstate"
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