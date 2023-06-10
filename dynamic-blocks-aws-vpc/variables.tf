variable "ports" {
  description = "Ports to open in the security group"
  type        = list(number)
  default     = [80, 443, 8080]
}