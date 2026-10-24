locals {
  automation_example = "Terraform automation starts with repeatable checks"
}

output "automation_message" {
  value = local.automation_example
}
