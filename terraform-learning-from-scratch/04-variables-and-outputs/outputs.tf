output "bucket_name" {
  description = "Name assigned to the S3 bucket"
  value       = aws_s3_bucket.learning.bucket
}

output "bucket_arn" {
  description = "Amazon Resource Name of the S3 bucket"
  value       = aws_s3_bucket.learning.arn
}
