import boto3
import logging
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

# AWS S3 configuration
BUCKET_NAME = "example-bucket-f363b875"  # Replace with actual S3 bucket name
FILE_TO_UPLOAD = "lambda.zip"  # Ensure this file exists before running
S3_OBJECT_NAME = "lambda.zip"  # Name in S3

def upload_file():
    s3_client = boto3.client('s3')
    try:
        s3_client.upload_file(FILE_TO_UPLOAD, BUCKET_NAME, S3_OBJECT_NAME)
        logger.info(f"File uploaded successfully: {S3_OBJECT_NAME} to {BUCKET_NAME}")
    except FileNotFoundError:
        logger.error(f"File not found: {FILE_TO_UPLOAD}")
    except NoCredentialsError:
        logger.error("No AWS credentials found. Please configure your AWS credentials.")
    except PartialCredentialsError:
        logger.error("Incomplete AWS credentials found. Please check your credentials.")
    except Exception as e:
        logger.error(f"An error occurred: {e}")

if __name__ == "__main__":
    upload_file()

