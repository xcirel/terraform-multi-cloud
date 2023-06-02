resource "aws_s3_bucket" "lifecycle" {
  bucket = "ericsantos-lifecycle"

  lifecycle {
    # create_before_destroy = true
    # prevent_destroy = true
    ignore_changes = [tags,]
  }
  tags = {
    class = "lifecycle"
  }
}