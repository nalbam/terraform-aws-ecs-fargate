# acm

resource "aws_acm_certificate" "cert" {
  count = var.base_domain != "" ? 1 : 0

  domain_name       = local.domain
  validation_method = "DNS"
}

resource "aws_route53_record" "cert_validation" {
  count = var.base_domain != "" ? 1 : 0

  zone_id = data.aws_route53_zone.app.0.id
  name    = element(concat(aws_acm_certificate.cert.0.domain_validation_options.*.resource_record_name, [""]), 0)
  type    = element(concat(aws_acm_certificate.cert.0.domain_validation_options.*.resource_record_type, [""]), 0)
  ttl     = 300

  records = [
    element(concat(aws_acm_certificate.cert.0.domain_validation_options.*.resource_record_value, [""]), 0),
  ]

  depends_on = [
    aws_acm_certificate.cert,
  ]
}

resource "aws_acm_certificate_validation" "cert" {
  count = var.base_domain != "" ? 1 : 0

  certificate_arn = aws_acm_certificate.cert.0.arn

  validation_record_fqdns = [
    aws_route53_record.cert_validation.0.fqdn,
  ]
}
