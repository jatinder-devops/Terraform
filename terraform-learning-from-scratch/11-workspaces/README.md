# 11 — Workspaces

Terraform CLI workspaces provide separate state instances for the same configuration. They can be useful for simple parallel environments, but they are not a complete isolation or access-control mechanism.

## Common commands

```bash
terraform workspace show
terraform workspace list
terraform workspace new test
terraform workspace select test
terraform workspace show
terraform workspace select default
terraform workspace delete test
```

You cannot delete the currently selected workspace. Switch to another workspace first.

## Use workspace-specific values

```hcl
locals {
  environment = terraform.workspace
}
```

You can use this value to vary names, but avoid blindly using workspace names to select production settings without validation.

## Important limitations

- Workspaces share the same configuration and provider setup.
- A workspace is not a security boundary.
- Separate accounts, credentials, backend configurations, or root modules may be better for production isolation.
- Never assume `terraform workspace` changes your AWS account or permissions.

## Practice

Run `terraform workspace new test`, inspect `terraform workspace show`, then switch back to `default`. The supplied `main.tf` outputs the selected workspace and does not create infrastructure.

```bash
terraform init
terraform plan
terraform apply
terraform output current_workspace
```
