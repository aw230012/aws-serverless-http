provider "aws" {
  version = "~> 2.0"
}

data "aws_lambda_function" "lambda-1" {
    function_name = "serverless-private-lambda"
}

data "aws_lambda_function" "lambda-2" {
    function_name = "serverless-private-lambda-2"
}

# by using this method for the first lambda integration
# we receive the default stage for free as this module
# uses aws quickstart lambda integration
module "api-gateway" {
    source = "../../modules/http-api-gateway"
    name = var.api-gw-name
    http-action = "GET"
    route = "widget"
    lambda = {
        arn = data.aws_lambda_function.lambda-1.arn
        invocation-arn = data.aws_lambda_function.lambda-1.invoke_arn
    }
}

# additional lambda integrations can be made using this module
module "api-gateway-lambda-integration-1" {
    source = "../../modules/http-api-gateway/integration"
    api-gw = {
        id = module.api-gateway.api-gw-id
        execution-arn = module.api-gateway.api-gw-execution-arn
    }
    lambda = {
        arn = data.aws_lambda_function.lambda-2.arn
        invocation-arn = data.aws_lambda_function.lambda-2.invoke_arn
    }
    route = {
        http-action = "GET"
        path = "example"
    }
}
