# 16 — Terraform Best Practices

Use these guidelines to make Terraform configurations easier to review, safer to operate, and more predictable.

## Structure

- Keep related resources together.
- Use descriptive resource and variable names.
- Split large configurations into logical files such as `providers.tf`, `variables.tf`, `main.tf`, and `outputs.tf`.
- Use modules for repeated patterns, not merely to make every file smaller.
- Document assumptions and deployment steps in README files.

## Version control

- Commit Terraform source files and `.terraform.lock.hcl`.
- Do not commit `.terraform/`, state files, plans, credentials, or secret variable files.
- Use pull requests and require review for meaningful infrastructure changes.

## Reproducibility

```hcl
terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

The version constraints above are examples, not a claim that these are the newest versions. Choose versions that your project has tested, and review upgrade notes before changing them.

## Inputs and outputs

- Declare variable types and descriptions.
- Add validation for values that have a restricted set of choices.
- Provide sensible defaults only when they are safe.
- Mark sensitive inputs and outputs appropriately, while remembering that state still needs protection.

## Safety and operations

- Review every plan before applying.
- Use remote state and supported locking for team workflows.
- Use least-privilege identities and short-lived credentials.
- Tag resources for owner, project, and environment.
- Test modules and run `fmt`, `validate`, and plan checks in CI.
- Avoid broad `ignore_changes` rules that hide drift.
- Keep provider versions controlled and update them deliberately.
- Have a recovery plan for important state and data.

## Final checklist

Before a real deployment, ask:
1. Is this the correct account and region?
2. Have I reviewed every create, update, replacement, and destroy action?
3. Could this expose a service publicly?
4. Is state protected?
5. Are costs and cleanup understood?
6. Is there an approved rollback or recovery plan?
