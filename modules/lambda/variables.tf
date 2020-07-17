variable "s3" {
    type = object({
        bucket = string
        key = string
        object-version = string
    })
}

variable "name" {
    type = string
}

variable "description" {
    type = string
}

variable "handler" {
    type = string
}

variable "role-arn" {
    type = string
}

variable "runtime" {
    type = string
}

variable "vpc-config" {
    type = object({
        subnet-ids = list(string)
        security-group-ids = list(string)
    })
}

variable "tags" {
    type = object({
        Name = string
        System = string
    })
}