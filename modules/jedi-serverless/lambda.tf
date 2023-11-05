# Create the Lambda function
resource "aws_lambda_function" "json_ingest_lambda" {
  filename      = "${path.module}/python/lambda_function.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = var.lambda_runtime

  environment {
    variables = {
      S3_BUCKET = var.bucket_name
      DYNAMODB_TABLE = var.table_name
    }
  }
}

# Adding S3 bucket as trigger to Lambda and giving the permissions
resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = var.bucket_name
  lambda_function {
    lambda_function_arn = aws_lambda_function.json_ingest_lambda.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]

  }
}
resource "aws_lambda_permission" "event" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.json_ingest_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.bucket_arn
}

# Output the Lambda function ARN for reference
output "lambda_function_arn" {
  value = aws_lambda_function.json_ingest_lambda.arn
}
