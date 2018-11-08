# security group

resource "aws_security_group" "lb" {
  name        = "tf-ecs-${var.name}-lb"
  description = "controls access to the ALB"

  vpc_id = "${aws_vpc.main.id}"

  ingress {
    protocol    = "tcp"
    from_port   = "${var.external_port}"
    to_port     = "${var.external_port}"
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
  name        = "tf-ecs-${var.name}-tasks"
  description = "allow inbound access from the ALB only"

  vpc_id = "${aws_vpc.main.id}"

  ingress {
    protocol        = "tcp"
    from_port       = "${var.internal_port}"
    to_port         = "${var.internal_port}"
    security_groups = ["${aws_security_group.lb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "tf-ecs-${var.name}-tasks"
  }
}
