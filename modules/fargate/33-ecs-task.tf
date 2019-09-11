# ecs task

resource "aws_ecs_task_definition" "app" {
  family                   = local.full_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory

  container_definitions = <<DEFINITION
[
  {
    "name": "${local.full_name}",
    "image": "${var.image}",
    "cpu": ${var.cpu},
    "memory": ${var.memory},
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.port},
        "hostPort": ${var.port}
      }
    ],
    "environment": [
      {
        "name": "PROFILE",
        "value": "${var.stage}"
      }
    ]
  }
]
DEFINITION

  tags = {
    Name    = local.full_name
    Cluster = var.cluster_name
  }
}
