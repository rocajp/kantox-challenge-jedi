# Create DynamoDB table for terraform state lock
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "${var.dynamodb_lock_table_name}"
  hash_key = "LockID"
  billing_mode   = "PAY_PER_REQUEST"
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
