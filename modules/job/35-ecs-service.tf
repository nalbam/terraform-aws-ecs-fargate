# ecs service

resource "aws_ecs_service" "app" {
  name            = local.name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = "1"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.private.id]
    subnets         = var.subnet_private_ids
  }
}
