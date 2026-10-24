# 10 — Remote State

Remote state stores Terraform's state in a shared backend instead of only in a local `terraform.tfstate` file. It is useful for teams, automation, and centralized access control.

## Benefits

- Team members and CI jobs can use the same state.
- A supported backend can provide state locking.
- State storage can be protected with cloud IAM and encryption controls.
- Local state files do not need to be shared manually.

## AWS S3 backend example

A backend configuration is placed in the root module's `terraform` block:

```hcl
terraform {
  backend "s3" {
    bucket       = "REPLACE_WITH_YOUR_STATE_BUCKET"
    key          = "learning/dev/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
```

The bucket must already exist and be configured securely. Use a unique key per state. The example uses S3 native lockfile support available in recent Terraform versions; confirm your Terraform version and current backend documentation before adopting it. Do not use a resource in the same configuration to create the bucket that its backend needs before initialization.

## Important setup guidance

1. Create a dedicated state bucket separately.
2. Enable versioning and appropriate encryption.
3. Restrict access with least-privilege IAM.
4. Use a distinct state key for each environment.
5. Run `terraform init` to initialize or migrate to the backend.
6. Review any migration prompt carefully and back up existing state first.

Do not put access keys in the backend block. Use the AWS credential chain or an IAM role.

## Commands

```bash
terraform init
terraform plan
terraform apply
terraform state list
```

Backend configuration and state can contain sensitive operational details. Treat them accordingly.
