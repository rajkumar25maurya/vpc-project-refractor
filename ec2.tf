resource "aws_key_pair" "ipraxa" {
    key_name = "ipraxa"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgpbQcRVVdKf5hL73rx1mr5kI86Q+f6a91gyPjXbiMcEaUTlv1e5Qf0Ph4TrbwC9PzCtW88Aj0Ru/30UwtS0p/sS5Zj39nth9uCep94BYYp94puXxb4YgbpcVexOsasKxSHILShJGmXLh894aWj/PQewnJbQ4dpZ6oDANBKO1E4yVN1vJ0oGPBA+QVb5q3WrXUWQF8VFgSzZDd+W3CGIz/G1FswOYYF3l0EwvNX6Zgwn4yoS4UO68deWZ5GnsPj70v2yBXYTYvPkEpofRxfAElho71xgn9iiGfiAcfyZLgBzaNG3goI/+Iv6lTjJT25HNFhzI3T6mmNjvp7hL9MJMmiGM7ZZHS62G9eQvsBauYmKRLiHCYKeUM5Bvzm738akgkTrB8KZNfZBaTa/52Lgn7hb0sG3xruRYVVCjefGAy61bWJksncxGRUhdgBVpsCHAB8X3Ifnm6nkygfH9d4xrGqZDhXs2Enj4lQw/C5JMlQxzRaMuwCPsGRIncZ54jwD8= raj@rajlap"
  
}

resource "aws_instance" "PublicEC2" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.nano"
    vpc_security_group_ids = [ "${aws_security_group.allow_ssh.id}" ]
    subnet_id = "${aws_subnet.publicSubnet-A.id}"
    key_name = "ipraxa"
    tags = {
        "Name" = "PublicEC2"
    }
    depends_on = [ "aws_vpc.mainvpc","aws_subnet.publicSubnet-A", "aws_security_group.allow_ssh" ]

    }

resource "aws_instance" "PrivateEC2" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.nano"
    vpc_security_group_ids = [ "${aws_security_group.allow_ssh.id}" ]
    subnet_id = "${aws_subnet.privateSubnet-A.id}"
    key_name = "ipraxa"
    tags = {
        "Name" = "PrivateEC2"
    }
    depends_on = [ "aws_vpc.mainvpc","aws_subnet.privateSubnet-A", "aws_security_group.allow_ssh" ]
}