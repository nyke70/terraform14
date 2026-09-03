resource "aws_s3_bucket" "name" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_tags_name
    Environment = "Dev"
  }
}