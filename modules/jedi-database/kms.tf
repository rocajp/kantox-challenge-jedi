# Create a CMK (Customer Managed Key) for DynamoDB encryption
resource "aws_kms_key" "dynamodb_encryption_key" {
  description             = "DynamoDB Encryption Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  policy = jsonencode({
    Version = "2012-10-17",
    Id      = "key-policy-1",
    Statement = [
      {
        Sid = "Enable IAM User Permissions",
        Effect = "Allow",
        Principal = "*",
        Action = [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Decrypt*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:GetPublicKey",
        ],
        Resource = "*"
      }
    ]
  })
}
