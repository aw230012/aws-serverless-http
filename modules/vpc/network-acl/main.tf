resource "aws_network_acl" "network-acl" {
    vpc_id = var.vpc-id
    subnet_ids = var.subnet-ids
    
    egress {
        protocol = var.egress-object.protocol
        rule_no = var.egress-object.rule_no
        action = var.egress-object.action
        cidr_block = var.egress-object.cidr_block
        from_port = var.egress-object.from_port
        to_port = var.egress-object.to_port
    }

    ingress {
        protocol = var.ingress-object.protocol
        rule_no = var.ingress-object.rule_no
        action = var.ingress-object.action
        cidr_block = var.ingress-object.cidr_block
        from_port = var.ingress-object.from_port
        to_port = var.ingress-object.to_port
    }

    tags = var.tags
}
