resource "aws_key_pair" "key" {
  key_name   = "aws-key-terraform"
  public_key = file("~/aws-key-terraform")
}