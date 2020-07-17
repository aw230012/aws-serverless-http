resource "aws_lambda_function" "lambda" {
    s3_bucket = var.s3.bucket
    s3_key = var.s3.key
    s3_object_version = var.s3.object-version
    function_name = var.name
    description = var.description
    handler = var.handler
    role = var.role-arn
    runtime = var.runtime
    vpc_config {
        subnet_ids = var.vpc-config.subnet-ids
        security_group_ids = var.vpc-config.security-group-ids
    }

    tags = var.tags
}
