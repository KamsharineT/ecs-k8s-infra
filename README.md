# ecs-k8s-infra

# ECS Fargate + ALB echoserver Terraform Setup

This repository deploys a simple **echoserver** container on **AWS ECS Fargate**, fronted by an **Application Load Balancer (ALB)** inside a custom **VPC** using **Terraform**.

The architecture includes:

- Custom VPC with public and private subnets
- ECS Cluster
- ECS Fargate Service running `k8s.gcr.io/e2e-test-images/echoserver:2.5`
- Application Load Balancer with a security group
- Target group linking ALB → ECS Fargate service

---

## **Repository Structure**


---

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) >= 1.5.0
2. AWS CLI configured with credentials
3. AWS account with permissions to create:
   - VPC, Subnets, Security Groups
   - ECS Cluster, ECS Service, Task Definition
   - Application Load Balancer and Target Groups

---

## Setup AWS Credentials

Terraform needs AWS credentials. You can provide them in one of the following ways:

### Option 1: Environment Variables
```bash
export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_ACCESS_KEY"
export AWS_DEFAULT_REGION="ap-southeast-1"
