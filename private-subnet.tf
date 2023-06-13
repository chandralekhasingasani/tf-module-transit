resource "aws_subnet" "private-subnet" {
  vpc_id     = data.aws_vpc.default-vpc.id
  cidr_block = var.PRIVATE_SUBNET_CIDR_BLOCK

  tags = {
    Name = "private-subnet-default-vpc"
  }
}

resource "aws_route_table_association" "private-rt-default-vpc" {
  subnet_id      = aws_subnet.private-subnet.id
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