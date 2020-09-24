# security group

resource "aws_security_group" "public" {
  name        = format("%s-public", local.full_name)
  description = "controls access to the ALB"

  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = "80"
    to_port     = "80"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = "443"
    to_port     = "443"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = local.full_name
    Service = local.name
    Cluster = var.cluster_name
  }
}

resource "aws_security_group" "private" {
  name        = format("%s-private", local.full_name)
  description = "allow inbound access from the ALB only"

  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = var.port
    to_port         = var.port
    security_groups = [aws_security_group.public.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = local.full_name
    Service = local.name
    Cluster = var.cluster_name
  }
}
