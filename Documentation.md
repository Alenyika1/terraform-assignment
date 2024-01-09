# Infrastructure Deployment Documentation

This Terraform project deploys and manages AWS infrastructure for creating EC2 instances and associated networking components. The infrastructure is modularized into two main components: `EC2_Instance` and `network`. The `EC2_Instance` module handles the creation of EC2 instances, while the `network` module manages the networking components such as VPC, subnets, internet gateway, and route tables..

## Project Overview

The infrastructure is divided into two main modules: `EC2_Instance` and `network`. The `EC2_Instance` module handles the creation of EC2 instances, while the `network` module takes care of VPC, subnets, internet gateways, and route tables.

## Directory Structure
```
project-root/
|-- child-modules/
|   |-- EC2-Instance/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |   |-- outputs.tf
|
|   |-- network/
|       |-- main.tf
|       |-- variables.tf
|       |-- outputs.tf
|   |-- development
        |-- providers.tf
        |-- root-module.tf
    |-- production
        |-- providers.tf
        |-- root-module.tf
```
### EC2_Instance Module

This module creates EC2 instances with the specified configuration. The variables include:

- `instance_name`: A unique name for the EC2 instance.
- `instance_ami`: The Amazon Machine Image (AMI) for the instance.
- `ec2_instance_type`: The type of EC2 instance, e.g., "t2.micro".
- `key_name`: The name of the key pair for SSH access.
- `key_filename`: The path to the SSH private key file.
- `security_name`: The name of the security group.
- `vpc_id_id`: The VPC ID from the `network` module.
- `private_subnet_id`: The private subnet ID from the `network` module.
- `public_subnet_id`: The public subnet ID from the `network` module.
- `environment`: The deployment environment, either "dev" or "prod".

### Network Module

This module handles the creation of VPC, subnets, internet gateways, and route tables. The variables include:

- `environment`: The deployment environment, either "dev" or "prod".
- `cidr_block`: The CIDR block for the VPC.
- `vpc_name`: A unique name for the VPC.
- `public_subnet`: The CIDR block for the public subnet.
- `private_subnet`: The CIDR block for the private subnet.

## Variables (variables.tf)

This file defines the input variables used in the Terraform configuration. Variables include information such as instance names, AMI IDs, instance types, key names, and networking details.

## Outputs (outputs.tf)

The outputs file defines the values that are useful to reference or export after the infrastructure is provisioned. Outputs may include instance details, subnet IDs, or other relevant information.

## Stages of Execution

1. **Module Initialization:** Execute `terraform init` in each module directory to initialize the Terraform configurations.

2. **Review and Verification:** Use `terraform plan` to review and verify the configuration before deployment.

3. **Infrastructure Deployment:** Execute `terraform apply` to deploy the infrastructure. Confirm by typing `yes` when prompted.

4. **Infrastructure Destruction:** If needed, execute `terraform destroy` to remove the deployed infrastructure.

## Execution Examples

### Development Environment

```bash
cd development
terraform init
terraform plan
terraform apply
```

### Production Environment

```bash
cd production
terraform init
terraform plan
terraform apply
```

## Success and Outputs

Upon successful execution, the infrastructure will be created, including VPCs, subnets, EC2 instances, security groups, and key pairs.

<!-- Images and information about the resources created can be found in the respective `images` directories for each environment. -->

## Additional Notes

- Ensure AWS credentials are configured properly for Terraform..
- Always follow best practices for managing sensitive information like private keys.

This documentation serves as a guide for deploying, managing, and destroying the infrastructure. Follow the specified steps for a seamless experience.