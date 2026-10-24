variable "environment" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Choose dev, test, or prod."
  }
}

output "example_name" {
  value = "learning-${var.environment}"
}
