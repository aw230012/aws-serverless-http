# What is this repo?
I wanted to start Terraforming environments across cloud providers to increase the technical agility of working with APIs. The first goal of this repo is to Terraform the resources necessary to create a serverless API using API Gateway with private lambda integration.

# How to use?
I wanted to follow best practices and keep complexity out of the HCL files. I also wanted to have good structure, so I went with a modular approach. The modules folder contains the resource HCL to generate the AWS environment for private Lambda integration with API Gateway. The modules subfolders are then broken-down by category of resource, such as VPC, Lambda, etc. 

Also included is an examples folder demonstrating how to invoke the modules. Currently, there are examples to replicate the Public/Private VPC Wizard configuration in AWS console. This will create a VPC, one public subnet and one private subnet. There is also an example to create to Lambdas that have access to resources on a private subnet. The final example will integrate the private lambdas with an API Gateway in the public subnet.

To test out the entire setup, you will need to Terraform **public-private-subnets** example first. Then the **private-lambda** example. Finally, Terraform **api-gateway-lambda-integration**. You can test by going to console and invoking the endpoints in the API Gateway.

# Caveats
1. Currently, only HTTP API Gateways are supported as this repo demonstrates private integration with Lambda.
1. There is not any sophistication in the API Gateway setup. Currently, variables are not supported and only the $default stage is created. These features will be upcoming in a future release.
1. This repo uses the aws_apigatewayv2_api resource, so it does make use of the quick create integration available for the first lambda integrated. There are other repos that integrate Lambda with API Gateway, but they're using the older resource which adds some complexity to the HCL. 
1. Additional Lambdas are integrated using the tandem of aws_apigatewayv2_integration and aws_apigatewayv2_route resources.
1. Aliasing and versioning Lambdas is not currently supported, but support is planned in the near future.
1. There is structure with how the modules are laid out, but limited in what they can do. It's very resource specific with minimal logic. This ensures the complexity stays out of the resources.
1. Not every property in the resources are supported. This really is a v0.1 implementation. This does not mean this repo will not help you. It certainly can, but you may need to make tweaks in the resource HCL to support your specific scenario.
1. Lambdas require source code be deployed when they are created by Terraform. The easiest option is to deploy from S3. Currently, S3 is the only supported deployment option for this repo. If you wish not to deploy Lambdas with this Terraform, you can certainly deploy using your favorite pipeline, then run the example HCL for the API Gateway integration. Using this HCL, all you need is the lambda name to integrate with API Gateway. You do not need to deploy the Lambda through this HCL.

# Contributions
This repo is certainly in no way complete or super-polished. I am interested in contributors. I'm not sure how far we can take this repo as it is highly specialized, but I think there are still some improvements that can be made. If you don't wish to contribute but have suggestions for improvements, feel free to send them my way.