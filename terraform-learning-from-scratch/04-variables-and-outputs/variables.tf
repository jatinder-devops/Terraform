variable "aws_region" {
  description = "AWS region where the bucket will be created"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Short project identifier"
  type        = string
  default     = "tf-learning"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be dev, test, or prod."
  }
}
