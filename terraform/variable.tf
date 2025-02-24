variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Unique name for the S3 bucket"
  type        = string
  default     = "example-bucket"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "example-lambda"
}
