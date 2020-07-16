output "internet-gateway-id" {
    value = aws_internet_gateway.igw.id
}

output "nat-gateway-id" {
    value = aws_nat_gateway.ngw.id
}
