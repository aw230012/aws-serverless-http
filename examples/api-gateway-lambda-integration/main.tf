provider "aws" {
  version = "~> 2.0"
}

data "aws_lambda_function" "lambda-to-integrate" {
    function_name = var.lambda-name
}

module "api-gateway" {
    source = "../../modules/http-api-gateway"
    name = var.api-gw-name
    http-action = var.http-action
    route = var.route
    lambda = {
        arn = data.aws_lambda_function.lambda-to-integrate.arn
        invocation-arn = data.aws_lambda_function.lambda-to-integrate.invoke_arn
    }
}
