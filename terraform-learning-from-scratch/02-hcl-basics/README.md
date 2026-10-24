# 02 — HCL Basics

Terraform configuration is written in HashiCorp Configuration Language (HCL). HCL uses blocks, arguments, expressions, and values.

## Basic syntax

```hcl
# This is a comment

variable "environment" {
  description = "Name of the environment"
  type        = string
  default     = "dev"
}

locals {
  project_name = "terraform-learning"
  full_name    = "${local.project_name}-${var.environment}"
}

output "resource_name_prefix" {
  value = local.full_name
}
```

## Blocks and arguments

A block has a type, optional labels, and a body. For example, `variable`, `locals`, `output`, `provider`, and `resource` are block types. Inside a block, arguments assign values to named settings.

```hcl
resource "aws_s3_bucket" "example" {
  bucket_prefix = "hcl-demo-"
}
```

- `resource` is the block type.
- `aws_s3_bucket` is the resource type.
- `example` is the local resource name.
- `bucket_prefix` is an argument.

## Common value types

```hcl
variable "instance_count" {
  type    = number
  default = 2
}

variable "enabled" {
  type    = bool
  default = true
}

variable "allowed_ports" {
  type    = list(number)
  default = [22, 80, 443]
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
```

Common types include `string`, `number`, `bool`, `list(T)`, `set(T)`, `map(T)`, `object({...})`, and `tuple([...])`.

## Expressions and references

```hcl
variable "environment" {
  type    = string
  default = "dev"
}

locals {
  bucket_prefix = "my-app-${var.environment}-"
}

output "prefix" {
  value = local.bucket_prefix
}
```

- `var.environment` reads an input variable.
- `local.bucket_prefix` reads a local value.
- `${...}` is useful for interpolation inside strings; direct expressions do not need it.

## Files in this directory

- `main.tf`: example input, local, and output blocks.
- `outputs.tf`: exposes the example result.

## Run the example

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

This section does not create cloud resources. `terraform apply` stores local state for the outputs. Use `terraform destroy` if you want to remove the local state-managed configuration.
