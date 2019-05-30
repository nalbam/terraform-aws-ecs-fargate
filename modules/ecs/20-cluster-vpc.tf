# cluster vpc

resource "aws_vpc" "cluster" {
  count      = var.vpc_id == "" ? 1 : 0
  cidr_block = var.vpc_cidr

  enable_dns_hostnames = true

  tags = {
    Name = local.full_name
  }
}

data "aws_vpc" "cluster" {
  id = var.vpc_id == "" ? aws_vpc.cluster[0].id : var.vpc_id
}

// Create an Internet Gateway.
resource "aws_internet_gateway" "cluster" {
  count  = var.vpc_id == "" ? 1 : 0
  vpc_id = aws_vpc.cluster[0].id

  tags = {
    Name = local.full_name
  }
}

data "aws_internet_gateway" "cluster" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.cluster.id]
  }
}
