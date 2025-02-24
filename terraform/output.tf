output "s3_bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}

output "lambda_function_name" {
  value = aws_lambda_function.example_lambda.function_name
}
