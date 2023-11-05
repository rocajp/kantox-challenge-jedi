# Create DynamoDB table for terraform state lock
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "${var.dynamodb_lock_table_name}"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
