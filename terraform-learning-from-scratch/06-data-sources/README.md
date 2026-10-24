# 06 — Data Sources

A data source reads information about infrastructure or other data that already exists. Unlike a managed resource, it does not create or own the object it reads.

## Resource vs. data source

```hcl
# Manages an instance
resource "aws_instance" "web" {
  # configuration omitted
}

# Reads an existing image ID from AWS
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
```

The data source is referenced as `data.aws_ami.amazon_linux.id`.

## Example use cases

- Look up the default VPC in a region.
- Find an AMI that matches filters.
- Read details of an existing subnet.
- Retrieve account or region information.

## Example configuration

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "region_name" {
  value = data.aws_region.current.name
}
```

The supplied example only reads account and region information; it does not create AWS resources. It still requires working AWS credentials.

## Run

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

Data source results may depend on the current account, permissions, region, and resources available at evaluation time.
