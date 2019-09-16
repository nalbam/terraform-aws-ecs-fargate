# locals

resource "random_pet" "this" {
  length = 1

  keepers = {
    name = var.name
  }
}

locals {
  name = "${var.name}-${var.stage}-${random_pet.this.id}"
}
