# Define backend for tfstate and locking
terraform {
  backend "s3" {
    encrypt = true
    bucket = "jproca-kantox-challenge"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
