#------------------------
#NAME: MANOJ SIRIPARTHI
#DATE: 23.02.2025
#DISCRIPTION: TERRAFORM FILES S3 BUCKET & LAMBDA FUCTION
#------------------------

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "${var.bucket_name}-${random_id.bucket_id.hex}"
  acl    = "private"
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}

resource "aws_lambda_function" "example_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  filename      = "../lambda.zip"
  source_code_hash = filebase64sha256("../lambda.zip")

  environment {
    variables = {
      LOG_LEVEL = "info"
    }
  }
}
