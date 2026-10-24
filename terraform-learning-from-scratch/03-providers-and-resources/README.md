# 03 — Providers and Resources

## Providers

A provider is a plugin that allows Terraform to communicate with an API. The AWS provider manages AWS resources; other providers work with other platforms.

The `required_providers` block declares the provider source and acceptable version range. `terraform init` downloads the selected provider and records selections in `.terraform.lock.hcl`.

## Resources

A resource describes an object Terraform should manage. Its general syntax is:

```hcl
resource "PROVIDER_RESOURCE_TYPE" "LOCAL_NAME" {
  # resource arguments
}
```

For example, an S3 bucket:

```hcl
resource "aws_s3_bucket" "example" {
  bucket_prefix = "tf-learning-"
}
```

Terraform references it as `aws_s3_bucket.example`.

## Example in `main.tf`

The supplied file configures AWS in `ap-south-1` and creates an S3 bucket with a generated suffix. Make sure the bucket is intended for practice and that you understand any charges before applying.

## Run

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

`terraform destroy` removes the bucket managed by this configuration. If you put data in it, ensure that you have backed up anything you need and understand the provider's deletion behavior.

## Credentials

Prefer an AWS CLI profile, environment-based credentials, or an IAM role. Do not hard-code keys in Terraform configuration or commit them to Git.

## Resource naming

The local Terraform name (for example, `learning`) is not necessarily the AWS resource's actual name. Cloud services may require globally unique names, which is why `bucket_prefix` is useful for a tutorial.
