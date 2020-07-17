public-subnet-name = "MyPublicSubnet"
private-subnet-name = "MyPrivateSubnet"
lambda = {
    name = "serverless-private-lambda"
    description = "demoable private lambda"
    handler = "index.handler"
    runtime = "nodejs12.x"
}
s3 = {
    bucket = "serverless-private-lambda-demo"
    key = "private-lambda-demo-function/function.zip"
    object-version = ""
}