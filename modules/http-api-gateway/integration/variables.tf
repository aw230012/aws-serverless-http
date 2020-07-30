variable "api-gw" {
    type = object({
        id = string
        execution-arn = string
    })
}

variable "lambda" {
    type = object({
        arn = string
        invocation-arn = string
    })
}

variable "route" {
    type = object({
        http-action = string
        path = string
    })
}
