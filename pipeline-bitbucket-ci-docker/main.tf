terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
  backend "s3" {
    bucket = "ericsantos-remote-state"
    key    = "pipeline-bitbucket-ci-docker/terraform.tfstate"
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "ericsantos-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}