# 04 — Variables and Outputs

Variables make a configuration reusable. Outputs display useful values after Terraform applies a configuration.

## Input variables

Declare variables in `variables.tf`:

```hcl
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-1"
}
```

Use them with `var.aws_region`.

## Set a variable

You can provide values using a `.tfvars` file, a `-var` argument, or environment variables for supported `TF_VAR_name` variables.

```bash
terraform plan -var="environment=testing"
```

Avoid putting secrets in command history or committing variable files containing secrets. Variables marked `sensitive = true` hide values from some CLI output, but do not encrypt values in state.

## Outputs

```hcl
output "bucket_name" {
  description = "Name of the bucket"
  value       = aws_s3_bucket.learning.bucket
}
```

Read an output with:

```bash
terraform output
terraform output bucket_name
```

## Files

- `main.tf`: provider and resource.
- `variables.tf`: input variables.
- `outputs.tf`: exported values.

## Run

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

The example creates an S3 bucket and may incur charges. After practice, use `terraform destroy`.
