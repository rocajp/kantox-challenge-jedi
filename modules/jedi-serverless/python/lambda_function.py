import json
import boto3

s3 = boto3.client('s3')
dynamodb = boto3.client('dynamodb')

def lambda_handler(event, context):
    # Specify your S3 bucket name and DynamoDB table name
    s3_bucket = 'jproca-kantox-challenge'
    dynamodb_table = 'jedi'

    # List all JSON files in the S3 bucket
    response = s3.list_objects_v2(Bucket=s3_bucket, Prefix='', Delimiter='/')
    
    for s3_object in response.get('Contents', []):
        # Check if the object is a JSON file
        if s3_object['Key'].endswith('.json'):
            # Retrieve the JSON file from S3
            s3_object_key = s3_object['Key']
            response = s3.get_object(Bucket=s3_bucket, Key=s3_object_key)
            json_data = response['Body'].read().decode('utf-8')

            # Parse the JSON data
            data = json.loads(json_data)

            # Iterate through the JSON data and put items into DynamoDB
            for item_key, item_data in data.items():
                item = {
                    'id': {'S': item_key},  # Use 'S' type for the primary key (String)
                    'name': {'S': item_data['name']},  # Use 'S' type for strings
                    'planet': {'S': item_data.get('planet', '')},  # Use 'S' type for strings
                    'power_level': {'N': str(item_data.get('power_level', 0))}  # Use 'N' type for numbers
                }

                # Ingest the item into DynamoDB
                dynamodb.put_item(TableName=dynamodb_table, Item=item)

    return {
        'statusCode': 200,
        'body': json.dumps('Data ingested into DynamoDB successfully!')
    }

