resource "aws_apigatewayv2_api" "api-gw" {
    name = var.name
    protocol_type = "HTTP"
    target = var.lambda.invocation-arn
    route_key = "${var.http-action} /${var.route}"
    tags = {
        Name = var.name
        System = "public-private-demo"
    }
}

resource "aws_lambda_permission" "allow-apigw" {
    statement_id = uuid()
    action = "lambda:InvokeFunction"
    function_name = var.lambda.arn
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_apigatewayv2_api.api-gw.execution_arn}/*/*/${var.route}"
}
