resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc-id
  availability_zone = var.availability-zone
  cidr_block        = var.cidr

  tags = var.tags
}
