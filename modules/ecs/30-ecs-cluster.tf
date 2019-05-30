# ecs

resource "aws_ecs_cluster" "cluster" {
  name = local.lower_name
}
