variable "role-name" {
    type = string
}

variable "trust-relationship-policy" {
    type = string
}

variable "role-policy-name" {
    type = string
}

variable "policy-file" {
    type = string
}

variable "tags" {
    type = object({
        Name = string
        System = string
    })
}