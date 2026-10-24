variable "example_secret" {
  description = "Placeholder to demonstrate the sensitive flag; do not use a real secret"
  type        = string
  sensitive   = true
  default     = "not-a-real-secret"
}

output "secret_is_sensitive" {
  description = "Demonstrates metadata about the variable without printing its value"
  value       = nonsensitive(var.example_secret != "")
}
