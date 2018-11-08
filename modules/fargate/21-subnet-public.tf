# subnet public

resource "aws_subnet" "public" {
  count = 2

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 8, 20 + count.index)}"

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}",
    )
  }"
}

resource "aws_internet_gateway" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}",
    )
  }"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.public.id}"
  }

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}",
    )
  }"
}

resource "aws_route_table_association" "public" {
  count = 2

  subnet_id      = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${aws_route_table.public.id}"
}
