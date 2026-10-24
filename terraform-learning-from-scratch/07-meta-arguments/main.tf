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

variable "bucket_purposes" {
  description = "Purpose labels for the practice buckets"
  type        = set(string)
  default     = ["logs", "assets"]
}

resource "aws_s3_bucket" "practice" {
  for_each      = var.bucket_purposes
  bucket_prefix = "tf-${each.key}-"

  tags = {
    Purpose    = each.key
    ManagedBy  = "Terraform"
    Environment = "dev"
  }

  lifecycle {
    prevent_destroy = false
  }
}

output "bucket_names" {
  value = { for purpose, bucket in aws_s3_bucket.practice : purpose => bucket.bucket }
}
