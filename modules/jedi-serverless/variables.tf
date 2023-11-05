variable "bucket_name" {
  description = "The name of the S3 bucket that contains JSON data files"
  type = string
}

variable "bucket_arn" {
  description = "The ARN of the S3 bucket that contains JSON data files"
  type = string
}

variable "table_name" {
  description = "The name of the DynamoDB table to store with encription the Jedi's data"
  type = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type = string
}

variable "lambda_runtime" {
  description = "The Lambda runtime"
  type = string
}
