variable "project_name" {
  type    = string
  default = "platform"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "service_names" {
  type    = list(string)
  default = ["web", "api", "worker"]
}

locals {
  name_prefix   = "${lower(var.project_name)}-${var.environment}"
  instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
  uppercase     = [for name in var.service_names : upper(name)]
  service_csv   = join(", ", var.service_names)
  common_tags = merge(
    { Project = var.project_name },
    { Environment = var.environment, ManagedBy = "Terraform" }
  )
}

output "name_prefix" {
  value = local.name_prefix
}

output "selected_instance_type" {
  value = local.instance_type
}

output "uppercase_service_names" {
  value = local.uppercase
}

output "service_csv" {
  value = local.service_csv
}

output "common_tags" {
  value = local.common_tags
}
