variable "location" {
  description = "Váriável que indica a região onde os recursos serão criados"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Varíavel que indica o nome do ambiente"
  type        = string
  default     = "develop"
}