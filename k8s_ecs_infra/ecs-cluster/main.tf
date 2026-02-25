resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}