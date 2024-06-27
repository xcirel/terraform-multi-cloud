variable "cidr_vpc" {
  description = "CIDR block for the VPC created"
  type        = string
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet created"
  type        = string
}

variable "environment" {
  description = "Environment where is deployed"
  type        = string
}