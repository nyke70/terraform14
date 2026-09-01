resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = var.vpc_tenency
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
}