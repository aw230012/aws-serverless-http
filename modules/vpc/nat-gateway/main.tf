resource "aws_internet_gateway" "igw" {
    vpc_id = var.vpc-id
    
    tags = var.tags
}

# in AWS NAT Gateways get a NIC automatically. When the NAT GW is associated
# to the EIP, the NIC will be assigned to EIP and the NAT GW will be associated
resource "aws_nat_gateway" "ngw" {
    allocation_id = var.allocation-id
    subnet_id = var.subnet-id

    tags = var.tags

    depends_on = [aws_internet_gateway.igw]
}
