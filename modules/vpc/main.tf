resource "aws_vpc" "main" {
    cidr_block = var.cidr
    instance_tenancy = var.instance-tenancy

    tags = var.tags
}