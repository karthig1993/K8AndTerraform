provider "aws" {
  region = "us-east-2"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

resource "aws_security_group" "test_group" {
  name = "cross-resource-att-testing"
}

resource "aws_vpc_security_group_ingress_rule" "test_ingress_rule" {
  #reference to security group block
  security_group_id = aws_security_group.test_group.id

  #reference to eip public IP address in first block
  cidr_ipv4   = "${aws_eip.lb.public_ip}/32"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}
