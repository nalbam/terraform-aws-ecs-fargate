# vpc

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}-${var.stage}",
    )
  }"
}
