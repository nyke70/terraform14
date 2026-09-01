# VPC

resource "aws_vpc" "VPC1" {
    cidr_block = var.vpc-cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        Name = "VPC-resumer-app"
        env  = "dev"
        Team = "Devops"
    }
}
// internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC1.id

  tags = {
    Name = "IGW"
  }
 // depends_on = [aws_vpc.VPC1]
}
// public subnet
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-1a"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-1b"
  }
}




resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-1a"
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-1b"
  }
}
// Nat Gateway 
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnet1.id
  tags = {
    Name = "gw NAT"
  }
}
// Elastic ip for Nate Gateway
resource "aws_eip" "eip" {
 
}


# 1. Create the Route Table public subnet
resource "aws_route_table" "public_rt" {
     vpc_id = aws_vpc.VPC1.id

     tags = { Name = "public-route-table" }
}

 # 2. Create a Route (Points all outbound traffic to an Internet Gateway) 
resource "aws_route" "public_internet_route" {
     route_table_id = aws_route_table.public_rt.id 

     destination_cidr_block = "0.0.0.0/0" 

     gateway_id = aws_internet_gateway.gw.id
} 

     # 3. Associate the Route Table with a Subnet 
resource "aws_route_table_association" "public_subnet_assoc" {
         subnet_id = aws_subnet.subnet1.id

         route_table_id = aws_route_table.public_rt.id 

}
resource "aws_route_table_association" "public_subnet_assoc2" {
         subnet_id = aws_subnet.subnet2.id

         route_table_id = aws_route_table.public_rt.id 

}

# 1. Create the Route Table private subnet
resource "aws_route_table" "private_rt" {
     vpc_id = aws_vpc.VPC1.id

     tags = { Name = "private-route-table" }

}

 # 2. Create a Route (Points all outbound traffic to an Internet Gateway) 
resource "aws_route" "private_internet_route" {
     route_table_id = aws_route_table.private_rt.id 

     destination_cidr_block = "0.0.0.0/0" 

     gateway_id = aws_nat_gateway.example.id

} 

     # 3. Associate the Route Table with a Subnet 
resource "aws_route_table_association" "private_subnet_assoc" {
         subnet_id = aws_subnet.subnet3.id

         route_table_id = aws_route_table.private_rt.id 

}

resource "aws_route_table_association" "private_subnet_assoc2" {
         subnet_id = aws_subnet.subnet4.id

         route_table_id = aws_route_table.private_rt.id

}
# resource "aws_route53_record" "www" {
#   zone_id = data.aws_route53_zone.selected.id
#   name    = "MYapp.nyke.it.com"
#   type    = "A"
#   ttl     = 300
#   records = ["200.10.19.34"]
# }
