provider "aws" {
  version = "~> 2.0"
}

module "vpc" {
    source = "../../modules/vpc"
    cidr = "172.16.0.0/16"
    tags = {
        Name = "MyVPC"
        System = "public-private-demo"
    }
}

module "public-subnet" {
    source = "../../modules/vpc/subnet"
    vpc-id = module.vpc.vpc-id
    availability-zone = "us-east-2a"
    cidr = "172.16.0.0/24"

    tags = {
        Name = "MyPublicSubnet"
        System = "public-private-demo"
    }
}

module "private-subnet" {
    source = "../../modules/vpc/subnet"
    vpc-id = module.vpc.vpc-id
    availability-zone = "us-east-2b"
    cidr = "172.16.1.0/24"

    tags = {
        Name = "MyPrivateSubnet"
        System = "public-private-demo"
    }
}

module "subnets-acl" {
    source = "../../modules/vpc/network-acl"
    vpc-id = module.vpc.vpc-id
    subnet-ids = [module.public-subnet.subnet-id, module.private-subnet.subnet-id]
    
    egress-object = {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        egress = true
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    ingress-object = {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        egress = false
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    tags = {
        Name = "PrivatePublicAcl"
        System = "public-private-demo"
    }
}

module "elastic-ip" {
    source = "../../modules/vpc/elastic-ip"
    public-ipv4-pool = "amazon"
}

module "nat-gateway" {
    source = "../../modules/vpc/nat-gateway"
    vpc-id = module.vpc.vpc-id
    subnet-id = module.public-subnet.subnet-id
    allocation-id = module.elastic-ip.eip-id

    tags = {
        Name = "PrivatePublicGW"
        System = "public-private-demo"
    }
}

module "route-table-public" {
    source = "../../modules/vpc/route-table"
    vpc-id = module.vpc.vpc-id
    subnet-id = module.public-subnet.subnet-id
    gateway-id = module.nat-gateway.internet-gateway-id

    tags = {
        Name = "PublicRouteTable"
        System = "public-private-demo"
    }
}

module "route-table-private" {
    source = "../../modules/vpc/route-table"
    vpc-id = module.vpc.vpc-id
    subnet-id = module.private-subnet.subnet-id
    gateway-id = module.nat-gateway.nat-gateway-id

    tags = {
        Name = "PrivateRouteTable"
        System = "public-private-demo"
    }
}