output "DEFAULT_VPC_ID" {
  value = var.DEFAULT_VPC_ID
}

output "DEFAULT_VPC_CIDR_BLOCK" {
  value = data.aws_vpc.default-vpc.cidr_block
}

output "TGW_ID" {
  value = aws_ec2_transit_gateway.main.id
}

output "TGW_DEFAULT_ATTACHMENT_ID" {
  value = aws_ec2_transit_gateway_vpc_attachment.default-vpc.id
}

output "TGW_DEFAULT_ROUTE_TABLE_ID" {
  value = aws_ec2_transit_gateway_route_table.default-vpc.id
}