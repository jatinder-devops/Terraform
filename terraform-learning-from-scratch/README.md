# Terraform Learning From Scratch

A beginner-friendly, hands-on guide to learning **Terraform and Infrastructure as Code (IaC)** from the fundamentals to practical AWS projects.

## Learning roadmap

| # | Topic | What you'll learn |
|---|---|---|
| 01 | Introduction | IaC, Terraform workflow, installation, first commands |
| 02 | HCL Basics | Terraform blocks, arguments, types, and syntax |
| 03 | Providers and Resources | Configure AWS and declare infrastructure |
| 04 | Variables and Outputs | Reusable inputs and useful outputs |
| 05 | Expressions and Functions | Locals, conditionals, loops, and functions |
| 06 | Data Sources | Read information about existing infrastructure |
| 07 | Meta-Arguments | `count`, `for_each`, `depends_on`, and lifecycle |
| 08 | State Management | Understand state, plans, refresh, and locking |
| 09 | Modules | Build reusable Terraform components |
| 10 | Remote State | Store state remotely and share it safely |
| 11 | Workspaces | Manage separate state instances |
| 12 | Security | Protect credentials, secrets, and state |
| 13 | Testing | Validate and test Terraform configurations |
| 14 | Automation | Run Terraform in scripts and CI/CD |
| 15 | AWS Projects | Practice with small AWS infrastructure projects |
| 16 | Best Practices | Organize, review, and maintain production-ready code |

## Prerequisites

- Basic terminal/Linux commands
- An editor such as VS Code
- Terraform CLI installed
- For AWS examples: an AWS account and AWS CLI configured with credentials
- Familiarity with basic cloud concepts is helpful, but not required

## Standard workflow

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform destroy
```

Review the plan before applying. AWS resources may incur charges. Run `terraform destroy` when you no longer need practice resources, and verify that the plan only affects resources you intend to change.

## Repository structure

Each numbered directory contains a README explaining the topic. Some sections also include runnable `.tf` examples. Examples that create AWS resources require valid AWS credentials and may incur charges.

## Recommended study method

1. Read a topic's README.
2. Inspect and type out the code yourself.
3. Run `terraform fmt` and `terraform validate`.
4. Review `terraform plan` before applying.
5. Record what changed and clean up practice resources.
6. Move to the next section only after you can explain the example in your own words.

## Safety notes

- Never commit AWS access keys, passwords, `.env` files, or Terraform state files.
- Do not use production accounts for experiments.
- Keep state files secure: they can contain sensitive values.
- Examples use placeholders where account-specific IDs or values are required.

Happy learning!
