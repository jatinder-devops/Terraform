terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "learning" {
  bucket_prefix = "terraform-learning-"

  tags = {
    Name        = "Terraform Learning Bucket"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

output "bucket_name" {
  description = "Name of the practice S3 bucket"
  value       = aws_s3_bucket.learning.bucket
}
