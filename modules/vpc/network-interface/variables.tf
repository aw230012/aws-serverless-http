variable "subnet-id" {
    type = string
}

variable "private-ips" {
    type = list(string)
}

variable "security-groups" {
    type = list(string)
    default = []
}
