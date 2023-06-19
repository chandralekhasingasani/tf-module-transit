variable "subnets" {
  default = ["172.31.96.0/20", "172.31.112.0/20", "172.31.128.0/20", "172.31.144.0/20", "172.31.160.0/20", "172.31.176.0/20"]
}

variable "AZ" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

resource "aws_subnet" "private" {
  count             = length(var.subnets)
  vpc_id            = var.DEFAULT_VPC_ID
  cidr_block        = element(var.subnets, count.index)
  availability_zone = element(var.AZ, count.index)
  tags = {
    Name = "default-vpc-private-${count.index + 1}"
  }
}

resource "aws_route_table_association" "private-rt-default-vpc" {
  subnet_id      = aws_subnet.private.*.id
  route_table_id = aws_route_table.private-rt-default-vpc.id
}

resource "aws_route_table" "private-rt-default-vpc" {
  vpc_id = data.aws_vpc.default-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "private-rt-default-vpc"
  }
}