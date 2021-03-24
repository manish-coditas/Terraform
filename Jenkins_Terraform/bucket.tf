resource "aws_s3_bucket" "b" {
  bucket = "agnani"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
