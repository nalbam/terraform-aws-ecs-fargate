# ecs

resource "aws_ecs_cluster" "cluster" {
  name = "${var.city}-${var.stage}-${var.name}"
}
