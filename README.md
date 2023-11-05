# Kantox Challenge 1
# The Jedi Council: Secrets of the Galaxy

# Pre-reqs
## Configure AWS credentials
```
aws configure
```
## Initialize terraform backend for tf state and tf locking
```
terraform -chdir="./global" init
terraform -chdir="./global" apply -auto-approve
```
For view the plan run:
```
terraform -chdir="./global" plan
```

# Challenge solution
## Components
- AWS S3 bucket for recive JSON files with Jedi's data
- AWS DynamoDB for write in table Jedi's data
- AWS KMS CMK for encrypt DynamoDB table with Jedi's data
- AWS Lambda function for get JSON files from S3 bucket and ingest the Jedi's data in DynamoDB encripted table
- AWS S3 notification event to automatically trigger the Lambda function

## Deploy solution
```
terraform -chdir="./prod" init
terraform -chdir="./prod" apply -auto-approve
```
For view the plan run:
```
terraform -chdir="./prod" plan
```

# Ingest Jedi's data (with JSON files)
```
# Replace <path> with the absolute path to JSON file with Jedi's data to upload
aws s3 cp <path> s3://jproca-kantox-challenge/

# Example:
aws s3 cp /tmp/data.json s3://jproca-kantox-challenge/
```
