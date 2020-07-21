variable "name" {
    type = string
}

variable "http-action" {
    type = string
}

variable "route" {
    type = string
}

variable "lambda" {
    type = object({
        arn = string
        invocation-arn = string
    })
}
