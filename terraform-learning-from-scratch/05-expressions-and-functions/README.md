# 05 — Expressions and Functions

Terraform expressions let you calculate values and make configuration dynamic.

## Locals

Use `locals` for values derived from inputs or repeated across resources.

```hcl
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
```

## Conditional expressions

Syntax: `condition ? true_value : false_value`

```hcl
locals {
  instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
}
```

This is only a selection example; actual instance types and costs vary by region and account.

## `for` expressions

```hcl
variable "names" {
  type    = list(string)
  default = ["web", "api", "worker"]
}

output "upper_names" {
  value = [for name in var.names : upper(name)]
}
```

## Useful functions

- `join(",", list)` — combine list values into a string.
- `split(",", string)` — split a string into a list.
- `lower(string)` / `upper(string)` — change letter case.
- `length(value)` — count characters or collection elements.
- `lookup(map, key, default)` — read a map value with a fallback.
- `merge(map1, map2)` — combine maps.
- `file(path)` — read a file available to Terraform during evaluation.

## Example

`main.tf` demonstrates locals, a conditional, a `for` expression, and common functions without creating cloud resources.

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

Review the resulting outputs to see how each expression evaluates.
