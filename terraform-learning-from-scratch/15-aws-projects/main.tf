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
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region for this learning project"
  type        = string
  default     = "ap-south-1"
}

resource "aws_s3_bucket" "practice" {
  bucket_prefix = "terraform-aws-project-"

  tags = {
    Name        = "Terraform AWS Learning Project"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

output "bucket_name" {
  description = "Generated name of the practice bucket"
  value       = aws_s3_bucket.practice.bucket
}

output "bucket_arn" {
  description = "ARN of the practice bucket"
  value       = aws_s3_bucket.practice.arn
}
