variable "public-subnet-name" {
    type = string
}

variable "private-subnet-name" {
    type = string
}

variable "s3" {
    type = object({
        bucket = string
        key = string
        object-version = string
    })
}

variable "lambda" {
    type = object({
        name = string
        description = string
        handler = string
        runtime = string
    })
}

