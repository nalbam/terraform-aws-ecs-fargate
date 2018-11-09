# route53

data "aws_route53_zone" "main" {
  count = "${var.base_domain != "" ? 1 : 0}"
  name  = "${var.base_domain}"
}

data "aws_acm_certificate" "main" {
  count    = "${var.base_domain != "" ? 1 : 0}"
  domain   = "${var.base_domain}"
  statuses = [
    "ISSUED"
  ]
  most_recent = true
}

resource "aws_route53_record" "main" {
  count   = "${var.base_domain != "" ? 1 : 0}"
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "tf-ecs-${var.name}-${var.stage}.${var.base_domain}"
  type    = "CNAME"
  ttl     = 300
  records = [
    "${aws_alb.main.dns_name}"
  ]
}
