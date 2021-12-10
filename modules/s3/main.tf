resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_prefix

  versioning {
    enabled = var.versioning
  }
  force_destroy = true
  tags = {
    Name = "s3-data-bootcamp"
  }
}