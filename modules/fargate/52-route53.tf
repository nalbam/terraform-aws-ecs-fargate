# route53

data "aws_route53_zone" "app" {
  count = "${var.base_domain != "" ? 1 : 0}"
  name  = "${var.base_domain}"
}

resource "aws_route53_record" "app" {
  count   = "${var.base_domain != "" ? 1 : 0}"
  zone_id = "${data.aws_route53_zone.app.zone_id}"
  name    = "${local.lower_name}.${var.cluster_name}.${var.base_domain}"
  type    = "CNAME"
  ttl     = 60

  records = [
    "${aws_alb.app.dns_name}",
  ]
}
