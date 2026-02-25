
# --- VPC ---
module "vpc" {
  source         = "./vpc"
  cluster_name   = var.cluster_name
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets= var.private_subnets
}

# --- ECS Cluster ---
module "ecs_cluster" {
  source       = "./ecs-cluster"
  cluster_name = var.cluster_name
}

# --- ALB ---
module "alb" {
  source         = "./alb"
  cluster_name   = var.cluster_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

# --- ECS Service ---
module "ecs_service" {
  source           = "./ecs-service"
  cluster_id       = module.ecs_cluster.ecs_cluster_id
  subnets          = module.vpc.public_subnets
  security_group_id= module.alb.alb_sg_id
  service_name     = "echoserver"
  alb_arn          = module.alb.alb_arn
  vpc_id           = module.vpc.vpc_id
}