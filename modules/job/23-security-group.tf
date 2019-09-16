# security group

resource "aws_security_group" "private" {
  name = "${local.name}-${var.cluster_name}-private"

  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${local.name}-${var.cluster_name}-private"
    Service = local.name
    Cluster = var.cluster_name
  }
}
