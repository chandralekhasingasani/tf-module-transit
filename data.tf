data "aws_vpc" "default-vpc" {
  id = var.DEFAULT_VPC_ID
}

data "aws_subnet" "route_table_id" {

}