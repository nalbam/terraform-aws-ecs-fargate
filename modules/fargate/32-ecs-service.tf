# ecs service

resource "aws_ecs_service" "main" {
  name            = "${var.name}-${var.stage}"
  cluster         = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.app.arn}"
  desired_count   = "${var.desired}"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = ["${aws_security_group.tasks.id}"]
    subnets         = ["${aws_subnet.private.*.id}"]
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.main.id}"
    container_name   = "${var.name}-${var.stage}"
    container_port   = "${var.port}"
  }

  depends_on = [
    "aws_alb_listener.http",
  ]
}
