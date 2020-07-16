variable "tags" {
    type = object({
        Name = string
        System = string
    })
}

variable "vpc-id" {
    type = string
}
