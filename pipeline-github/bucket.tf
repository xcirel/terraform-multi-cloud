resource "aws_s3_bucket" "first_bucket" {
  bucket = "ericsantos-remote-state"

  versioning {
    enabled = true
  }
}