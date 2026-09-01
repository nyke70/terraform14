
output "vpc_id" {
  value = aws_vpc.VPC1.id
}

output "public_subnet1_id" {
  value = aws_subnet.subnet1.id
}
output "Nat_gateway_id" {
  value = aws_nat_gateway.example.id
}

output "vpc_arn" {
  value = aws_vpc.VPC1.arn
}