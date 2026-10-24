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

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

output "account_id" {
  description = "AWS account used by the active credentials"
  value       = data.aws_caller_identity.current.account_id
}

output "region_name" {
  description = "Region configured for the AWS provider"
  value       = data.aws_region.current.name
}
