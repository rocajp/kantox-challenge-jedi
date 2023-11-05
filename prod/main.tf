terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws"
   }
 }
}

provider "aws" {
  region = var.region
}

module "jedi-database" {
  source = "../modules/jedi-database"
  table_name = var.table_name
}

module "jedi-serverless" {
  source = "../modules/jedi-serverless"
  bucket_name = var.bucket_name
  bucket_arn = var.bucket_arn
  table_name = var.table_name
  lambda_function_name = var.lambda_function_name
  lambda_runtime = var.lambda_runtime
}



