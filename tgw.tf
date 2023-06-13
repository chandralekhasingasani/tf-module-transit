resource "aws_ec2_transit_gateway" "main" {
  description = "${var.ENV}-tgw"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "default-vpc" {
  subnet_ids         = [aws_subnet.private-subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = data.aws_vpc.default-vpc.id
}

