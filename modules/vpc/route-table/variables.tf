variable "tags" {
    type = object({
        Name = string
        System = string
    })
}

variable "vpc-id" {
    type = string
}

variable "subnet-id" {
    type = string
}

variable "gateway-id" {
    type = string
}
