resource "aws_apigatewayv2_integration" "integration" {
    api_id = var.api-gw.id
    integration_type = "AWS_PROXY"
    integration_method = "POST"
    integration_uri = var.lambda.invocation-arn
}

resource "aws_apigatewayv2_route" "route" {
    api_id = var.api-gw.id
    route_key = "${var.route.http-action} /${var.route.path}"
    target = "integrations/${aws_apigatewayv2_integration.integration.id}"
}

resource "aws_lambda_permission" "allow-apigw" {
    statement_id = uuid()
    action = "lambda:InvokeFunction"
    function_name = var.lambda.arn
    principal = "apigateway.amazonaws.com"
    source_arn = "${var.api-gw.execution-arn}/*/*/${var.route.path}"
}
