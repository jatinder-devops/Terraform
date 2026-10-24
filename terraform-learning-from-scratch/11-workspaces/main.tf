locals {
  current_workspace = terraform.workspace
}

output "current_workspace" {
  description = "Currently selected Terraform CLI workspace"
  value       = local.current_workspace
}

output "example_name" {
  description = "Example name that changes by workspace"
  value       = "learning-${local.current_workspace}"
}
