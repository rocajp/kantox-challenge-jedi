# Input variable: S3 bucket name
variable "bucket_name" {
  description = "The name of the S3 bucket for entire challenge"
  default = "my-bucket"
}

# Input variable: AWS Region
variable "region" {
  description = "The AWS region"
  default = "us-east-1"
}

# Input variable: dynamodb-lock-table
variable "dynamodb_lock_table_name" {
  description = "The name of the DynamoDB table for locking terraform"
  default = "dynamodb_lock_table_terraform"
}
