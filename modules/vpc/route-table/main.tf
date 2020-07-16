resource "aws_route_table" "route-table" {
    vpc_id = var.vpc-id

    tags = var.tags
}

resource "aws_route" "route" {
    route_table_id = aws_route_table.route-table.id
    gateway_id = var.gateway-id
    destination_cidr_block = "0.0.0.0/0"
    depends_on = [aws_route_table.route-table]
}

resource "aws_route_table_association" "route-association" {
    subnet_id = var.subnet-id
    route_table_id = aws_route_table.route-table.id
    depends_on = [aws_route_table.route-table]
}
