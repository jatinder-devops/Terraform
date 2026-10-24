# 08 — State Management

Terraform state maps configuration to real infrastructure and records attributes Terraform needs for future plans.

## Why state matters

Terraform uses state to know which remote objects it manages, track resource identities, and determine changes. State may contain sensitive data, even when outputs are marked sensitive.

## Common commands

```bash
terraform state list
terraform state show aws_s3_bucket.learning
terraform state pull
terraform plan
terraform apply
```

`terraform state pull` prints the current state, so handle its output as sensitive. Do not paste it into public issues or commit it to Git.

## Refresh and planning

Modern Terraform refreshes state as part of normal planning. `terraform plan -refresh-only` previews state updates based on remote infrastructure. `terraform apply -refresh-only` applies those state updates without proposing configuration changes to remote resources.

## Do not edit state by hand

Prefer Terraform's state commands for supported state operations. Commands such as `terraform state mv`, `terraform state rm`, and `terraform import` can affect resource tracking; read their documentation and back up state before using them.

## State locking

Some backends support locking so two operations do not update the same state concurrently. Local state and remote backend behavior differ. Do not disable locking casually.

## Example workflow

```bash
terraform init
terraform plan
terraform apply
terraform state list
terraform state show <resource-address>
```

Replace `<resource-address>` with an address shown by `terraform state list`.

## Cleanup and security

- Keep state files out of version control.
- Restrict access to state and backend storage.
- Use remote state with access controls and encryption for team environments.
- Do not manually delete state to fix an error; it can orphan resources from Terraform's tracking.
