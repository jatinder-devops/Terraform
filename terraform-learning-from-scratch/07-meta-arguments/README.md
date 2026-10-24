# 07 — Meta-Arguments

Meta-arguments change how Terraform manages resources. They are not ordinary provider-specific resource arguments.

## `count`

Use `count` to create a number of similar instances.

```hcl
resource "aws_s3_bucket" "logs" {
  count         = 2
  bucket_prefix = "my-log-${count.index}-"
}
```

Each instance is addressed with an index, such as `aws_s3_bucket.logs[0]`.

## `for_each`

Use `for_each` when each instance has a meaningful key.

```hcl
variable "buckets" {
  type    = set(string)
  default = ["logs", "assets"]
}

resource "aws_s3_bucket" "named" {
  for_each      = var.buckets
  bucket_prefix = "tf-${each.key}-"
}
```

Instances are addressed by key, such as `aws_s3_bucket.named["logs"]`. Use stable keys; changing keys can cause Terraform to plan replacement or removal/addition.

## `depends_on`

Use `depends_on` to declare a dependency that Terraform cannot infer from an expression reference. Avoid adding it when a natural reference already communicates the dependency.

## `lifecycle`

```hcl
lifecycle {
  prevent_destroy = true
}
```

Other lifecycle settings include `create_before_destroy`, `ignore_changes`, and `replace_triggered_by`. Understand the impact before using them; lifecycle rules can make changes harder or prevent expected updates.

## Supplied example

The `main.tf` uses `for_each` to create two practice S3 buckets with generated names. It requires AWS credentials and may incur charges.

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```
