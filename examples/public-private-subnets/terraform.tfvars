system-name = "public-private-demo"

vpc = {
    cidr = "172.16.0.0/16"
    name = "MyVPC"
    public-subnet = {
        cidr = "172.16.0.0/24"
        name = "MyPublicSubnet"
    }
    private-subnet = {
        cidr = "172.16.1.0/24"
        name = "MyPrivateSubnet"
    }
}