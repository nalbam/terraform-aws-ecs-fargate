# ecs

resource "aws_ecs_cluster" "cluster" {
  name = var.name

  tags = {
    Name = var.name
  }
}
