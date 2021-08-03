#resource "aws_key_pair" "ipraxa" {
#    key_name = "ipraxa"
#    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOBs6nJ6/JYLYU0hmldv7DrtVWiU3LftcIXd5lb6AxYwxC+70FoUToOy/Y6732e5fic3n+4/wQcGtkuawErSPy9WH6GxeQpZmtSqU6Ip+mkObcj8vHSFTpNAK+LoKhZe8H670dObIo/bIiEj0g3YmrF7cMTKVLv46MQdz+dhcWN5VsbtaMYik7JKDP6KRDE88LcFjLDilR3/07qp7H87YFZ01f1ETX/r+Wl4jolQtp53nGw2j7KWg8K/aAJ8a3HrlPd3RQvyfNmTbYshS9eob+OPlVjM67+7fQehEaaApgQfnMqOc+B6G9Bn60OinJCp+1KdtFR9mrl25DeJAkNSsiKmNI1jAhulpybEPZaitimm2V0+v58/3twWsTdJb8HfLNBD3jTWXJsSyVziIewjKl77u/iSg+YWe36Xnp4K5YKCFpjGqVwePQQ1LyDYh/+Zze197Gc0jEjb4W6fXhQatR77zsUQXWZVbkPo2z0LjRTCGK0hEvKpNhwHOrkmWPyxc= Raj@Raj"
  
#}

resource "aws_instance" "PublicEC3" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = [ "${aws_security_group.allow_ssh.id}" ]
    subnet_id = "${aws_subnet.publicSubnet-A.id}"
    key_name = "ipraxa"
    tags = {
        "Name" = "PublicEC3"
    }
    depends_on = [ "aws_vpc.mainvpc","aws_subnet.publicSubnet-A", "aws_security_group.allow_ssh" ]

    }

resource "aws_instance" "PrivateEC3" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = [ "${aws_security_group.allow_ssh.id}" ]
    subnet_id = "${aws_subnet.privateSubnet-A.id}"
    key_name = "ipraxa"
    tags = {
        "Name" = "PrivateEC3"
    }
    depends_on = [ "aws_vpc.mainvpc","aws_subnet.privateSubnet-A", "aws_security_group.allow_ssh" ]
}