# ecs

resource "aws_ecs_cluster" "cluster" {
  name = "${local.full_name}"
}
