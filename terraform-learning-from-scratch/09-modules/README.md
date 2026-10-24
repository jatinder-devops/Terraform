# 09 — Modules

A Terraform module is a collection of `.tf` files in one directory. The root module is the directory where you run Terraform; child modules are called from it.

## Why modules?

- Reuse standard infrastructure patterns.
- Separate concerns, such as networking and compute.
- Provide a consistent interface through inputs and outputs.
- Make configurations easier to maintain.

## Simple module layout

```text
project/
├── main.tf
└── modules/
    └── labels/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

A module call:

```hcl
module "labels" {
  source      = "./modules/labels"
  project     = "demo"
  environment = "dev"
}
```

## Module inputs and outputs

Inside the child module, declare variables in `variables.tf` and outputs in `outputs.tf`. The root module can then reference `module.labels.name_prefix`.

## Supplied example

The `main.tf` demonstrates a local module that computes a name prefix. It does not create cloud resources.

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform output
```

For reusable modules, document inputs, outputs, required provider versions, expected permissions, and any assumptions. Pin remote module versions or Git references for repeatable builds.
