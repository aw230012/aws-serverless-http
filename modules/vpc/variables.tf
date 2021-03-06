variable "tags" {
    type = object({
        Name = string
        System = string
    })
}

variable "cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "instance-tenancy" {
    type = string
    default = "default"
}
