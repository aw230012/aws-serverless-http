variable "system-name" {
    type = string
}

variable "vpc" {
    type = object({
        cidr = string
        name = string
        public-subnet = object({
            cidr = string
            name = string
        })
        private-subnet = object({
            cidr = string
            name = string
        })
    })
}
