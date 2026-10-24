# 15 — AWS Projects

This section provides a small progression of AWS practice projects. Begin with read-only exercises, then move to resource creation only after you understand IAM permissions, costs, and cleanup.

## Project 1: Identify the active AWS account

```hcl
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

Use this to verify which identity Terraform is using before making changes.

## Project 2: Create a practice S3 bucket

The supplied `main.tf` creates an S3 bucket with a generated prefix. It is intentionally small and does not enable public access. S3 storage and requests may incur charges.

Commands:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output bucket_name
terraform destroy
```

## Project 3: EC2 instance (design exercise)

An EC2 instance requires more decisions than a simple bucket: AMI, instance type, subnet, security group, SSH access, key management, and cost. Do not expose SSH (`22`) to the entire internet unless there is a specific, controlled reason. Prefer Session Manager or tightly restricted access.

Illustrative resource shape:

```hcl
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-learning-instance"
  }
}
```

This is not a complete EC2 configuration by itself. You must define the variables, network context, and access controls.

## Project checklist

- Confirm the AWS account and region.
- Use a dedicated learning environment.
- Apply least-privilege permissions.
- Review the plan and expected costs.
- Add tags for ownership and environment.
- Confirm outputs do not expose secrets.
- Destroy disposable resources and verify the result.

## Cost warning

AWS charges depend on region, resource type, usage, and account settings. Review current AWS pricing and billing alerts before applying. `terraform destroy` may not delete separately managed resources or preserve data automatically.
