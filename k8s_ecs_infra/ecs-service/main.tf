resource "aws_lb_target_group" "echoserver" {
  name        = "${var.service_name}-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_ecs_task_definition" "echoserver" {
  family                   = var.service_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = var.service_name
    image     = "k8s.gcr.io/e2e-test-images/echoserver:2.5"
    essential = true
    portMappings = [{
      containerPort = 8080
      hostPort      = 8080
    }]
  }])
}

resource "aws_ecs_service" "echoserver" {
  name            = var.service_name
  cluster         = var.cluster_id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.echoserver.arn
  desired_count   = 2

  network_configuration {
    subnets         = var.subnets
    security_groups = [var.security_group_id]
    assign_public_ip= true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.echoserver.arn
    container_name   = var.service_name
    container_port   = 8080
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = var.alb_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.echoserver.arn
  }
}