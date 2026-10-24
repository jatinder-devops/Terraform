# 12 — Terraform Security

Terraform configuration, plans, logs, and state may expose sensitive information. Treat infrastructure code as security-relevant.

## 1. Never hard-code credentials

Avoid this:

```hcl
provider "aws" {
  access_key = "AKIA..."
  secret_key = "secret..."
}
```

Prefer AWS profiles, environment-based credentials, workload identity, or IAM roles. Use least privilege.

## 2. Mark sensitive variables

```hcl
variable "database_password" {
  description = "Database password supplied securely"
  type        = string
  sensitive   = true
}
```

The `sensitive` flag redacts values in some Terraform output. It does **not** guarantee the value is absent from state or every log.

## 3. Protect files

Add local state, variable files, plan files, and `.env` files to `.gitignore`. Do not commit secrets or state to Git. Restrict access to remote state and encrypt it at rest and in transit.

## 4. Review plans

```bash
terraform plan
terraform plan -out=plan.tfplan
terraform show plan.tfplan
```

Plan files can contain sensitive values. Store them securely and delete them when no longer needed. Review the proposed actions before applying.

## 5. Validate changes

- Use code review and branch protection.
- Pin provider versions and commit `.terraform.lock.hcl`.
- Scan repositories for leaked secrets.
- Apply least-privilege IAM permissions.
- Keep Terraform and providers updated.
- Avoid exposing outputs that are not needed.

## Practice

The supplied `main.tf` shows a sensitive input variable without creating resources. Provide a test value locally only if needed; never use a real production secret for this exercise.
