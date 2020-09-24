# ecs task

resource "aws_ecs_task_definition" "app" {
  family                   = local.name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory

  container_definitions = format("[%s]", local.json_map)

  tags = {
    Name    = local.full_name
    Service = local.name
    Cluster = var.cluster_name
  }
}
