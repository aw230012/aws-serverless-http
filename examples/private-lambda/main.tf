provider "aws" {
  version = "~> 2.0"
}

data "aws_subnet" "public-subnet" {
    filter {
        name = "tag:Name"
        values = [var.public-subnet-name]
    }
}

data "aws_subnet" "private-subnet" {
    filter {
        name = "tag:Name"
        values = [var.private-subnet-name]
    }
}

module "lambda-iam" {
    source = "../../modules/iam"
    role-name = "private_lambda_execution_role"
    trust-relationship-policy = "${path.module}/trust-relationship-policy.json"
    role-policy-name = "private_lambda_policy"
    policy-file = "${path.module}/role-policy.json"
    tags = {
        Name = "PrivateLambdaExecutionRole"
        System = "public-private-demo"
    }
}

module "security-group" {
    source = "../../modules/vpc/security-group"
    name = "http-s-lambda-sg"
    description = "http_s access for lambda functions"
    vpc-id = data.aws_subnet.private-subnet.vpc_id
    ingress-rules = [
        {
            description = "http"
            from-port = 80
            to-port = 80
            protocol = "tcp"
            cidr_blocks = [data.aws_subnet.public-subnet.cidr_block]
        },
        {
            description = "https"
            from-port = 443
            to-port = 443
            protocol = "tcp"
            cidr_blocks = [data.aws_subnet.public-subnet.cidr_block]
        }
    ]
    egress-rules = [
        {
            description = "all traffic"
            from-port = 0
            to-port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }        
    ]

    tags = {
        Name = "PrivateLambdaSecurityGroup"
        System = "public-private-demo"
    }
}

module "example-lambda-1" {
    source = "../../modules/lambda"
    s3 = {
        bucket = "serverless-private-lambda-demo"
        key = "private-lambda-demo-function/function.zip"
        object-version = ""
    }
    name = "serverless-private-lambda"
    description = "demoable private lambda"
    handler = "index.handler"
    role-arn = module.lambda-iam.role-arn
    runtime = "nodejs12.x"

    vpc-config = {
        subnet-ids = [data.aws_subnet.private-subnet.id]
        security-group-ids = [module.security-group.id]
    }

    tags = {
        Name = "serverless-private-lambda"
        System = "public-private-demo"
    }
}

module "example-lambda-2" {
    source = "../../modules/lambda"
    s3 = {
        bucket = "serverless-private-lambda-demo"
        key = "private-lambda-demo-function-2/index.zip"
        object-version = ""
    }
    name = "serverless-private-lambda-2"
    description = "demoable private lambda example 2"
    handler = "index.handler"
    role-arn = module.lambda-iam.role-arn
    runtime = "nodejs12.x"

    vpc-config = {
        subnet-ids = [data.aws_subnet.private-subnet.id]
        security-group-ids = [module.security-group.id]
    }

    tags = {
        Name = "serverless-private-lambda-2"
        System = "public-private-demo"
    }
}
