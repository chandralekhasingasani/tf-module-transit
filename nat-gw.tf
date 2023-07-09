resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = var.DEFAULT_PUBLIC_SUBNET_ID

  tags = {
    Name = "${var.ENV}-default-vpc-ngw"
  }
}

resource "aws_eip" "elastic_ip" {
  domain   = "vpc"
}

output "NAT_GW_IP" {
  value = aws_nat_gateway.gw.private_ip
}