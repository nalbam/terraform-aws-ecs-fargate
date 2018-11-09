# security group

resource "aws_security_group" "lb" {
  name        = "tf-ecs-${var.name}-lb"
  description = "controls access to the ALB"

  vpc_id = "${aws_vpc.main.id}"

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

  tags {
    Name = "tf-ecs-${var.name}-lb"
  }
}

resource "aws_security_group" "tasks" {
  name        = "tf-ecs-${var.name}-${var.stage}-tasks"
  description = "allow inbound access from the ALB only"

  vpc_id = "${aws_vpc.main.id}"

  ingress {
    protocol        = "tcp"
    from_port       = "${var.port}"
    to_port         = "${var.port}"
    security_groups = ["${aws_security_group.lb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "tf-ecs-${var.name}-${var.stage}-tasks"
  }
}
