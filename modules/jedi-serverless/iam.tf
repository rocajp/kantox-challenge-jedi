# Create an IAM role for the Lambda function
resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach policies to the Lambda execution role
resource "aws_iam_policy_attachment" "lambda_s3_policy" {
  name = "lambda_s3_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  roles      = [aws_iam_role.lambda_execution_role.name]
}

resource "aws_iam_policy_attachment" "lambda_dynamodb_policy" {
  name = "lambda_dynamodb_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  roles      = [aws_iam_role.lambda_execution_role.name]
}
 
resource "aws_iam_role_policy" "revoke_keys_role_policy" {
  name = "lambda_revoke_keys_policy"
  role = aws_iam_role.lambda_execution_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*",
        "ses:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

