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
