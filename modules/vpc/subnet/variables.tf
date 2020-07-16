variable "tags" {
    type = object({
        Name = string
        System = string
    })
}

variable "vpc-id" {
    type = string
}

variable "cidr" {
    type = string
}

variable "availability-zone" {
    type = string
}

