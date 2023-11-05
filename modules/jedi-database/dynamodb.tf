# Create a DynamoDB table with encryption for Jedi's data
resource "aws_dynamodb_table" "dynamodb_table" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }
  server_side_encryption {
    enabled = true
    kms_key_arn = aws_kms_key.dynamodb_encryption_key.arn
  }
  tags = {
    Name = "JSONData"
  }
}
