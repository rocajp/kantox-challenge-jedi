# Output variable: S3 bucket ARN
output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}
