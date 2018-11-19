# vpc

resource "aws_vpc" "default" {
  count = "${var.vpc_id == "" ? 1 : 0}"

  cidr_block = "${var.cidr_block}"

  enable_dns_hostnames = true

  tags = {
    Name = "${local.upper_name}-VPC"
  }
}

data "aws_vpc" "default" {
  id = "${var.vpc_id == "" ? element(concat(aws_vpc.default.*.id, list("")), 0) : var.vpc_id}"
}
