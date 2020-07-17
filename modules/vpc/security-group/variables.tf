variable "name" {
    type = string
}

variable "description" {
    type = string
}

variable "vpc-id" {
    type = string
}

variable "ingress-rules" {
    type = list(object({
        description = string
        from-port = number
        to-port = number
        protocol = string
        cidr_blocks = list(string)
    }))
}

variable "egress-rules" {
    type = list(object({
        description = string
        from-port = number
        to-port = number
        protocol = string
        cidr_blocks = list(string)
    }))
}

variable "tags" {
    type = object({
        Name = string
        System = string
    })
}