# Create a S3 bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket		  = "${var.bucket_name}"
  
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning_terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
