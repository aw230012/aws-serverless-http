provider "aws" {
  version = "~> 2.0"
}

module "vpc" {
    source = "../../modules/vpc"
    cidr = var.vpc.cidr
    tags = {
        Name = var.vpc.name
        System = var.system-name
    }
}

module "public-subnet" {
    source = "../../modules/vpc/subnet"
    vpc-id = module.vpc.vpc-id
    availability-zone = "us-east-2a"
    cidr = var.vpc.public-subnet.cidr

    tags = {
        Name = var.vpc.public-subnet.name
        System = var.system-name
    }
}

module "private-subnet" {
    source = "../../modules/vpc/subnet"
    vpc-id = module.vpc.vpc-id
    availability-zone = "us-east-2b"
    cidr = var.vpc.private-subnet.cidr

    tags = {
        Name = var.vpc.private-subnet.name
        System = var.system-name
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
        System = var.system-name
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
        System = var.system-name
    }
}

module "route-table-public" {
    source = "../../modules/vpc/route-table"
    vpc-id = module.vpc.vpc-id
    subnet-id = module.public-subnet.subnet-id
    gateway-id = module.nat-gateway.internet-gateway-id

    tags = {
        Name = "PublicRouteTable"
        System = var.system-name
    }
}

module "route-table-private" {
    source = "../../modules/vpc/route-table"
    vpc-id = module.vpc.vpc-id
    subnet-id = module.private-subnet.subnet-id
    gateway-id = module.nat-gateway.nat-gateway-id

    tags = {
        Name = "PrivateRouteTable"
        System = var.system-name
    }
}