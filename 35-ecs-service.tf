# ecs service

resource "aws_ecs_service" "app" {
  name            = local.name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.desired
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.private.id]
    subnets         = var.private_subnet_ids
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = local.name
    container_port   = var.port
  }

  depends_on = [aws_alb_listener.http]
}

resource "aws_appautoscaling_target" "app" {
  service_namespace  = "ecs"
  resource_id        = "service/${var.cluster_name}/${aws_ecs_service.app.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  max_capacity       = var.max
  min_capacity       = var.min
}
