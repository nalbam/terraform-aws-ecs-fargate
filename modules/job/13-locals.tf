# locals

resource "random_pet" "this" {
}

locals {
  full_name = "${var.name}-${var.stage}-${random_pet.this.id}"
}
