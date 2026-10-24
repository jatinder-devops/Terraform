# 13 — Testing Terraform

Testing helps catch syntax errors, invalid values, and unexpected infrastructure changes before deployment.

## Validation commands

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
terraform plan
```

- `fmt -check` checks formatting without changing files.
- `init -backend=false` initializes providers without configuring a backend; provider installation may still require network access.
- `validate` checks configuration syntax and internal consistency.
- `plan` compares configuration with current state and remote infrastructure where relevant.

## Terraform tests

Recent Terraform versions support native `.tftest.hcl` tests. Exact features depend on the installed Terraform version and test design. A test can call a module or configuration and assert expected values.

Illustrative test shape:

```hcl
# example.tftest.hcl
run "example_name" {
  command = plan

  assert {
    condition     = output.example_name == "learning-default"
    error_message = "The example name did not match the expected value."
  }
}
```

This test is illustrative and should be placed beside a configuration that defines `output.example_name`. Test syntax and supported assertions depend on the Terraform version.

## Useful practices

- Test modules with representative inputs.
- Include invalid-input validation tests.
- Run formatting and validation in pull requests.
- Use plan review for changes that affect real infrastructure.
- Use a disposable account for integration tests that create resources.

## Supplied example

`main.tf` provides a small local output for practicing `fmt`, `validate`, `plan`, and output checks without creating cloud infrastructure.
