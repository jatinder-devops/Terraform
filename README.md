<div align="center">

# ☁️ Terraform — Infrastructure as Code

### Automate. Provision. Manage. Scale.

**A hands-on Terraform learning repository focused on AWS infrastructure automation, reusable configurations, and DevOps practices.**

[![Terraform](https://img.shields.io/badge/Terraform-Infrastructure_as_Code-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![AWS](https://img.shields.io/badge/AWS-Cloud_Provider-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![Linux](https://img.shields.io/badge/Linux-Administration-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://ubuntu.com/)

</div>

---

## 📌 About This Repository

Welcome to my **Terraform learning repository**!

This repository documents my journey of learning Infrastructure as Code (IaC) and automating cloud infrastructure using Terraform.

The goal is to understand how to define, provision, configure, and manage infrastructure through code instead of creating every resource manually through a cloud console.

I am using this repository to develop practical skills in Terraform, AWS, infrastructure automation, and reusable infrastructure design as part of my DevOps learning journey.

### 🎯 Objectives

- Understand Infrastructure as Code and Terraform fundamentals.
- Learn HashiCorp Configuration Language (HCL).
- Provision and manage AWS resources using Terraform.
- Create VPCs, subnets, route tables, and security groups.
- Automate EC2 instance provisioning.
- Understand input variables, outputs, and data sources.
- Learn Terraform modules and reusable configurations.
- Understand Terraform state management.
- Apply infrastructure security best practices.
- Build practical cloud infrastructure projects.

---

## 🧠 What Is Terraform?

Terraform is an Infrastructure as Code tool developed by HashiCorp.

It allows engineers to define infrastructure using declarative configuration files and manage that infrastructure through a repeatable workflow.

Instead of manually creating resources, you describe the desired infrastructure in Terraform configuration files.

Terraform then compares the desired configuration with its current state and generates a plan showing the changes required.

### 🔄 Terraform Workflow

```text
       Write Terraform Configuration
                    |
                    v
             terraform init
                    |
                    v
            terraform fmt
                    |
                    v
           terraform validate
                    |
                    v
             terraform plan
                    |
                    v
             terraform apply
                    |
                    v
          Infrastructure Created
                    |
                    v
          Monitor and Manage
```

---

## ⚙️ Technologies and Tools

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| AWS | Cloud infrastructure provider |
| HCL | Terraform configuration language |
| Linux / Ubuntu | Development and administration environment |
| Git | Version control |
| GitHub | Source code management and documentation |
| AWS CLI | Command-line interaction with AWS |

---

## 📚 Topics Covered

The repository is intended to cover the following Terraform concepts as the learning journey progresses.

| No. | Topic | What You Learn |
|---:|---|---|
| 01 | Introduction | Infrastructure as Code and Terraform basics |
| 02 | HCL Basics | Blocks, arguments, expressions, and syntax |
| 03 | Providers and Resources | Configure providers and define infrastructure |
| 04 | Variables and Outputs | Make configurations flexible and reusable |
| 05 | Expressions and Functions | Work with Terraform expressions and functions |
| 06 | Data Sources | Reference existing infrastructure |
| 07 | Meta-Arguments | Use `count`, `for_each`, `depends_on`, and lifecycle rules |
| 08 | State Management | Understand Terraform state and resource tracking |
| 09 | Modules | Build reusable infrastructure components |
| 10 | Remote State | Store and share state remotely |
| 11 | Workspaces | Separate infrastructure configurations by workspace |
| 12 | Security | Protect credentials, state, and cloud resources |
| 13 | Testing | Validate and test Terraform configurations |
| 14 | Automation | Integrate Terraform into automated workflows |
| 15 | AWS Projects | Apply Terraform concepts to practical infrastructure |

*Note: These topics describe the intended learning scope; the actual repository folders may differ.*

---

## ☁️ AWS Infrastructure Learning

Terraform can manage many AWS resources through the AWS provider.

The following are examples of infrastructure components that can be explored in practical labs.

### 🌐 Networking

- Virtual Private Cloud (VPC)
- Public and private subnets
- Internet Gateway
- Route tables and associations
- Network connectivity
- Security groups

### 🖥️ Compute

- Amazon EC2 instances
- Instance configuration
- Key pairs
- User data scripts
- Dynamic resource creation
- Instance outputs

### 🔐 Security

- Security group ingress and egress rules
- IAM permissions
- Least-privilege access
- Sensitive variables
- Secure state management

### 🧩 Reusable Infrastructure

- Input variables
- Output values
- Local values
- Data sources
- Terraform modules
- Resource dependencies

---

## 🛠️ Installation and Prerequisites

Before running Terraform configurations, prepare the following:

- A Linux or Ubuntu environment.
- Terraform CLI installed.
- An AWS account.
- AWS CLI installed.
- AWS credentials configured securely.
- Git installed.
- Basic knowledge of Linux and networking.

### Verify Terraform Installation

```bash
terraform --version
```

### Verify AWS CLI

```bash
aws --version
```

### Verify AWS Authentication

```bash
aws sts get-caller-identity
```

This command displays information about the AWS identity associated with your configured credentials.

**Security reminder:** Never commit AWS access keys, secret keys, passwords, private keys, or sensitive Terraform state files to GitHub.

---

## 🚀 Getting Started

### Step 1: Clone the Repository

```bash
git clone https://github.com/jatinder-devops/Terraform.git
```

### Step 2: Enter the Repository

```bash
cd Terraform
```

### Step 3: Explore the Files

```bash
ls -la
```

Review the Terraform configuration files before executing any commands.

### Step 4: Initialize Terraform

Run this command from the directory containing the configuration you want to use:

```bash
terraform init
```

Terraform initializes the working directory and downloads the required provider plugins.

### Step 5: Format the Configuration

```bash
terraform fmt -recursive
```

This formats Terraform configuration files to a consistent style.

### Step 6: Validate the Configuration

```bash
terraform validate
```

This checks whether the Terraform configuration is syntactically valid and internally consistent.

### Step 7: Review the Execution Plan

```bash
terraform plan
```

Review the proposed changes before creating or modifying infrastructure.

### Step 8: Apply the Configuration

```bash
terraform apply
```

Review the plan and type `yes` when prompted if you want to proceed.

### Step 9: Inspect Terraform State

```bash
terraform state list
```

This lists the resources currently tracked by Terraform state.

### Step 10: Destroy Lab Infrastructure

```bash
terraform destroy
```

Use this only when you intend to remove the infrastructure managed by the configuration.

**Important:** Review the proposed destruction carefully. Resources not managed by this configuration may remain, and some resources may incur charges even when a lab is not actively being used.

---

## 🧩 Why Use Terraform Modules?

Terraform modules allow infrastructure configurations to be organized into reusable components.

For example, instead of repeatedly writing the same networking resources, you can create a reusable VPC module and configure it with different input values.

### Example Module Structure

```text
modules/
└── vpc/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

| File | Responsibility |
|---|---|
| `main.tf` | Defines the resources |
| `variables.tf` | Declares configurable inputs |
| `outputs.tf` | Exposes useful resource information |

### Benefits of Modules

- Reduce duplicated code.
- Improve maintainability.
- Standardize infrastructure.
- Make configurations easier to reuse.
- Simplify infrastructure management across environments.

---

## 🔐 Terraform Security Best Practices

Infrastructure automation must be secure as well as functional.

My learning objectives include applying the following practices:

- Never hardcode AWS credentials in Terraform files.
- Use IAM roles and least-privilege permissions where appropriate.
- Keep sensitive files out of version control.
- Protect Terraform state because it can contain sensitive values.
- Review `terraform plan` before applying changes.
- Use restrictive security group rules.
- Store passwords and secrets in an appropriate secret-management service.
- Use remote state with suitable access controls, encryption, versioning, and state-locking capabilities where supported.
- Pin compatible Terraform and provider versions.
- Separate development and production configurations appropriately.

### Recommended `.gitignore` Entries

```gitignore
# Terraform working directory
.terraform/

# Terraform state
*.tfstate
*.tfstate.*

# Variable files that may contain secrets
*.tfvars
*.tfvars.json

# Crash logs
crash.log
crash.*.log

# Local override files
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Sensitive local configuration
.terraformrc
terraform.rc
```

**Note:** If you intentionally version non-sensitive example variable files, review them carefully before adding exceptions. Never commit real secrets or state files containing sensitive data.

---

## 📈 My DevOps Learning Journey

This repository is part of my ongoing journey to develop practical DevOps and cloud engineering skills.

My focus is on learning concepts, implementing configurations, understanding errors, and improving infrastructure through hands-on practice.

The learning process includes:

- Understanding Terraform fundamentals.
- Practicing AWS resource provisioning.
- Learning reusable module design.
- Troubleshooting infrastructure issues.
- Improving configuration security.
- Documenting practical examples.
- Developing repeatable infrastructure workflows.

---

## 📖 Official Learning Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Tutorials](https://developer.hashicorp.com/terraform/tutorials)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [Terraform Language Documentation](https://developer.hashicorp.com/terraform/language)

---

## 🤝 Contributions and Feedback

Suggestions, improvements, and constructive feedback are welcome.

If you find an issue or have an idea for improving the examples, feel free to open an issue or submit a pull request.

Learning infrastructure automation is an ongoing process, and documenting mistakes and solutions is an important part of becoming a better engineer.

---

## ⭐ Support This Repository

If you find this repository useful for learning Terraform and Infrastructure as Code:

- ⭐ Star the repository.
- 🍴 Fork it for your own learning.
- 📢 Share it with other aspiring DevOps engineers.
- 💬 Suggest improvements and additional practical examples.

---

<div align="center">

### 🚀 Learn by Building. Improve by Practicing. Automate with Terraform.

**Infrastructure as Code is more than writing configuration files — it's about building repeatable, maintainable, and reliable infrastructure.**

</div>
