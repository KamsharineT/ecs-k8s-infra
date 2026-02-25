resource "aws_security_group" "alb_sg" {
  name        = "${var.cluster_name}-alb-sg"
  vpc_id      = var.vpc_id
  description = "Allow HTTP"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb" {
  name               = "${var.cluster_name}-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [aws_security_group.alb_sg.id]
}

output "alb_sg_id" { value = aws_security_group.alb_sg.id }
output "alb_arn"   { value = aws_lb.alb.arn }