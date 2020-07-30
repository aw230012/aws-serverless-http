output "api-gw-id" {
    value = aws_apigatewayv2_api.api-gw.id
}

output "api-gw-execution-arn" {
    value = aws_apigatewayv2_api.api-gw.execution_arn
}
