resource "aws_internet_gateway" "gw" {
    vpc_id = var.vpc-vpc_id
    
    tags = var.tags
}
