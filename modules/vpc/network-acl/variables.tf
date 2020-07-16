variable "vpc-id" {
    type = string
}

variable "subnet-ids" {
    type = list(string)
}

variable "tags" {
    type = object({
        Name = string
        System = string
    })
}

variable "egress-object" {
    type = object({
        protocol = string
        rule_no = number
        action = string
        egress = bool
        cidr_block = string
        from_port = number
        to_port = number
    })
}

variable "ingress-object" {
    type = object({
        protocol = string
        rule_no = number
        action = string
        egress = bool
        cidr_block = string
        from_port = number
        to_port = number
    })
}
