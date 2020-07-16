resource "aws_eip" "eip" {
    vpc = true
    public_ipv4_pool = var.public-ipv4-pool
}
