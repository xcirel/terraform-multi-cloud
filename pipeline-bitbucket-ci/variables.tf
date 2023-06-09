variable "location" {
  description = "Var to indicate the region where resources should be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_pub_key" {
  description = "Public key for VM in AWS"
  type        = string
}