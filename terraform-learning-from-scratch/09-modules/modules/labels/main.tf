variable "project" {
  description = "Project identifier"
  type        = string
}

variable "environment" {
  description = "Environment identifier"
  type        = string
}

locals {
  name_prefix = "${lower(var.project)}-${lower(var.environment)}"
}

output "name_prefix" {
  description = "Normalized project and environment prefix"
  value       = local.name_prefix
}
