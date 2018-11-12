# subnet public

resource "aws_subnet" "public" {
  count      = "${length(data.aws_availability_zones.azs.names) > 3 ? 3 : length(data.aws_availability_zones.azs.names)}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 8, 10 + count.index)}"

  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"

  map_public_ip_on_launch = true

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}-${var.stage}-public",
    )
  }"
}

resource "aws_internet_gateway" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags = "${
    map(
     "Name", "tf-ecs-${var.name}-${var.stage}-public",
    )
  }"
}

resource "aws_route" "public" {
  route_table_id         = "${aws_vpc.main.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public.id}"
}
