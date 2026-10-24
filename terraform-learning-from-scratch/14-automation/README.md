# 14 — Terraform Automation

Terraform commands can be run in shell scripts and CI/CD pipelines. Automation should make runs consistent without bypassing review or security controls.

## Basic shell workflow

```bash
#!/usr/bin/env bash
set -euo pipefail

terraform init
terraform fmt -check -recursive
terraform validate
terraform plan -out=tfplan
terraform show tfplan
# Apply only after the plan has been reviewed and approved:
# terraform apply tfplan
```

Save this as a script inside the root configuration directory and make it executable with `chmod +x script.sh`. The script deliberately does not automatically apply changes.

## CI/CD stages

A typical workflow is:

1. Checkout the repository.
2. Install a pinned Terraform version.
3. Configure short-lived cloud credentials securely.
4. Run formatting and validation checks.
5. Generate a plan.
6. Store and review the plan securely.
7. Require approval for production changes.
8. Apply the reviewed plan using the intended identity.
9. Record logs and results without leaking secrets.

## Automation safety

- Do not print credentials or state to logs.
- Use protected CI variables or OIDC/workload identity where available.
- Restrict who can approve and apply production changes.
- Keep plan artifacts access-controlled and short-lived.
- Avoid running `terraform destroy` automatically in ordinary pipelines.
- Make sure concurrent jobs cannot apply conflicting changes to the same state.

## Practice

The supplied `main.tf` has only local values and outputs. You can use it to practice the command sequence without provisioning AWS resources.
