variable "tags" {
    type = object({
        Name = string
        System = string
    })
}

variable "vpc-id" {
    type = string
}

variable "allocation-id" {
    type = string
}

variable "subnet-id" {
    type = string
}
