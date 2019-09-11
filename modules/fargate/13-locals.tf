# locals

locals {
  full_name = "${var.name}-${var.stage}"

  domain = var.domain != "" ? var.domain : "${local.full_name}.${var.cluster_name}.${var.base_domain}"
}

locals {
  dns_name = var.base_domain != "" ? local.domain : aws_alb.app.dns_name
}
