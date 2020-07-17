resource "aws_security_group" "lambda-service" {
    name = var.name
    description = "http/s support"
    vpc_id = var.vpc-id

    tags = var.tags
}

resource "aws_security_group_rule" "ingress-rules" {
    count = length(var.ingress-rules)
    security_group_id = aws_security_group.lambda-service.id
    type = "ingress"
    description = var.ingress-rules[count.index].description
    from_port = var.ingress-rules[count.index].from-port
    to_port = var.ingress-rules[count.index].to-port
    protocol = var.ingress-rules[count.index].protocol
    cidr_blocks = var.ingress-rules[count.index].cidr_blocks
}

resource "aws_security_group_rule" "egress-rules" {
    count = length(var.egress-rules)
    security_group_id = aws_security_group.lambda-service.id
    type = "egress"
    description = var.egress-rules[count.index].description
    from_port = var.egress-rules[count.index].from-port
    to_port = var.egress-rules[count.index].to-port
    protocol = var.egress-rules[count.index].protocol
    cidr_blocks = var.egress-rules[count.index].cidr_blocks
}
