variable "cidr_vpc" {
  description = "Cidr block for VPC"
  type        = string
}

variable "cidr_subnet" {
  description = "Cidr block for subnet"
  type        = string
}

variable "environment" {
  description = "Environment where the resource will be utilized"
  type        = string
}