variable "region" {
    default = "us-east-1"
    
    }

variable "vpc_cidr" {
    default = "10.0.0.0/16"

}

variable "instance_type" {
    default = "t2.nano"
}


variable "ami" {
    default = "ami-09e67e426f25ce0d7"
}

variable "public_subnet_cidr" {
    default = "10.0.0.0/24"

}

variable "private_subnet_cidr" {
    default = "10.0.16.0/20"
    
}

variable "availability_zone" {
    default = "us-east-1a"    
}