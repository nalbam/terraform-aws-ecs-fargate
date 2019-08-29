# locals

locals {
  full_name = "${var.city}-${var.stage}-${var.name}-${var.suffix}"

  upper_name = upper(local.full_name)

  lower_name = lower(local.full_name)
}
