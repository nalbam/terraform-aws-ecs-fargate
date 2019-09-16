# locals

locals {
  name = "${var.name}-${var.stage}"

  domain = var.domain != "" ? var.domain : "${local.name}.${var.cluster_name}.${var.base_domain}"

  dns_name = var.base_domain != "" ? local.domain : aws_alb.app.dns_name
}
