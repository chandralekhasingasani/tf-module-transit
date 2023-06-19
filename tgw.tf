resource "aws_ec2_transit_gateway" "main" {
  description = "${var.ENV}-tgw"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  tags = {
    Name = "tgw-${var.ENV}"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "default-vpc" {
  tags = {
    Name = "tgw-default-vpc-${var.ENV}"
  }
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  subnet_ids         = [aws_subnet.private-subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = data.aws_vpc.default-vpc.id
}

resource "aws_ec2_transit_gateway_route_table" "default-vpc" {
  tags = {
    Name = "tgw-rt-default-vpc-${var.ENV}"
  }
  transit_gateway_id = aws_ec2_transit_gateway.main.id
}

resource "aws_ec2_transit_gateway_route_table_association" "default-vpc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.default-vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default-vpc.id
}


