resource "aws_network_interface" "nic" {
    subnet_id = var.subnet-id
    private_ips = var.private-ips

    // eventually we'll want to handle an attachment but we could make 
    // a module for attached network interfaces
}