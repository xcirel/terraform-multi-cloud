variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "region" {
  description = "The region in which to provision resources."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone in which to provision resources."
  type        = string
  default     = "us-central1-a"
}

variable "image" {
  description = "The image to use for the instance."
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}
