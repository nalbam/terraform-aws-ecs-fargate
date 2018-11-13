// subnet public

resource "aws_subnet" "public" {
  count             = "${length(data.aws_availability_zones.azs.names) > 3 ? 3 : length(data.aws_availability_zones.azs.names)}"
  vpc_id            = "${data.aws_vpc.default.id}"
  cidr_block        = "${cidrsubnet(data.aws_vpc.default.cidr_block, 8, 10 + count.index)}"
  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.city}-${upper(element(split("", data.aws_availability_zones.azs.names[count.index]), length(data.aws_availability_zones.azs.names[count.index])-1))}-${var.stage}-${var.name}-PUBLIC"
  }
}

resource "aws_internet_gateway" "public" {
  count  = "${length(data.aws_availability_zones.azs.names) > 0 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.default.id}"

  tags = {
    Name = "${local.full_name}-PUBLIC"
  }
}

resource "aws_route_table" "public" {
  count  = "${length(data.aws_availability_zones.azs.names) > 0 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.public.id}"
  }

  tags = {
    Name = "${local.full_name}-PUBLIC"
  }
}

resource "aws_route_table_association" "public" {
  count          = "${length(data.aws_availability_zones.azs.names) > 3 ? 3 : length(data.aws_availability_zones.azs.names)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
