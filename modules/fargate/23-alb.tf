# alb

resource "aws_alb" "main" {
  name            = "${var.name}-${var.stage}"
  subnets         = ["${var.subnet_public_ids}"]
  security_groups = ["${aws_security_group.public.id}"]
}

resource "aws_alb_target_group" "main" {
  name        = "${var.name}-${var.stage}"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
  target_type = "ip"
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.main.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.main.id}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "https" {
  count = "${var.base_domain != "" ? 1 : 0}"

  load_balancer_arn = "${aws_alb.main.id}"
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "${data.aws_acm_certificate.main.arn}"

  default_action {
    target_group_arn = "${aws_alb_target_group.main.id}"
    type             = "forward"
  }
}
