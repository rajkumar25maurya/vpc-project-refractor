resource "aws_vpc" "mainvpc" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
        Name = "VPC-TF"
    }
}

resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic/ Alllow all outbound traffic"
    vpc_id = "${aws_vpc.mainvpc.id}"

    ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    
    } 

    egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    to_port = 0
    protocol = "-1"
    }
    tags = {
      "Name" = "SecurityGroup_TF"
    }
    depends_on = [ "aws_vpc.mainvpc" ]
}

resource "aws_internet_gateway" "IGF_TF" {
    vpc_id = "${aws_vpc.mainvpc.id}"
    tags = {
      "Name" = "IGF_TF"
    }  
}

resource "aws_eip" "EIP" {
    vpc = true
    tags = {
      "Name" = "EIP"
    }
}

resource "aws_nat_gateway" "NATGW" {
    allocation_id = "${aws_eip.EIP.id}"
    subnet_id = "${aws_subnet.publicSubnet-A.id}"
    tags = {
      "Name" = "NATGW"
    }
    depends_on = [ "aws_eip.EIP","aws_subnet.publicSubnet-A" ]

}