# locals

locals {
  full_name  = "${var.stage}-${var.name}"
  lower_name = "${lower(local.full_name)}"
}
