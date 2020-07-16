# What is this repo?
I wanted to start Terraforming environments across cloud providers to increase the technical agility of working with APIs. The first goal of this repo is to Terraform the resources necessary to create a serverless API using API Gateway with private lambda integration. 

In the examples folder there are currently two subfolders. The **public-private-subnets** subfolder will create a VPC with 1 public subnet and 1 private subnet. The HCL will create a VPC similar to the **VPC with Public and Private Subnets** option located in the AWS Management Console's VPC Wizard. If you need something else other than this type of environment, you will need to tweak the HCL.

Once the VPC is created, the **private-lambda** examples subfolder will terraform a lambda to execute on a private subnet. The lambda code will not be deployed through Terraform in this example. Please note, this HCL is still in the works.

Finally, the **api-gateway-lambda-integration** example will demonstrate how to integrate an API Gateway with a private lambda. Please note, this HCL is also still in the works.

This repo is a v0.1 repo and is no way finalized. I expect updates and improvements to continue as it is being used.
