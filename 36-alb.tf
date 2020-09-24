# alb

resource "random_pet" "alb" {
  length = 1

  keepers = {
    name = var.name
  }
}

resource "aws_alb" "app" {
  # name_prefix = "fg-"
  name = "${var.name}-${random_pet.alb.id}"

  subnets = var.public_subnet_ids

  security_groups = [
    aws_security_group.public.id
  ]

  tags = {
    Name    = local.full_name
    Service = local.name
    Cluster = var.cluster_name
  }
}

resource "aws_alb_target_group" "app" {
  name     = aws_alb.app.name
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "ip"

  tags = {
    Name    = local.full_name
    Service = local.name
    Cluster = var.cluster_name
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app.arn
    type             = "forward"
  }
}

resource "aws_alb_listener" "https" {
  count = var.base_domain != "" ? 1 : 0

  load_balancer_arn = aws_alb.app.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.cert[0].arn

  default_action {
    target_group_arn = aws_alb_target_group.app.arn
    type             = "forward"
  }
}
