# locals

locals {
  full_name  = "${var.name}-${var.stage}"
  lower_name = "${lower(local.full_name)}"
  upper_name = "${upper(local.full_name)}"
}
