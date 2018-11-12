# subnet private

resource "aws_subnet" "private" {
  count = "${var.az_count}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 8, 30 + count.index)}"

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}-${var.stage}-private",
    )
  }"
}

resource "aws_route_table" "private" {
  count  = "${var.az_count}"
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.gw.*.id, count.index)}"
  }

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}-${var.stage}-private",
    )
  }"
}

resource "aws_route_table_association" "private" {
  count = "${var.az_count}"

  subnet_id      = "${aws_subnet.private.*.id[count.index]}"
  route_table_id = "${aws_route_table.private.*.id[count.index]}"
}
