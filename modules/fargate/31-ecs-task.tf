# ecs task

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.name}-${var.stage}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.cpu}"
  memory                   = "${var.memory}"

  container_definitions = <<DEFINITION
[
  {
    "name": "${var.name}-${var.stage}",
    "image": "${var.image}",
    "cpu": ${var.cpu},
    "memory": ${var.memory},
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.internal_port},
        "hostPort": ${var.internal_port}
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
}
