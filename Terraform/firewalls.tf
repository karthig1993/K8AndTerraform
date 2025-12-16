provider "aws" {
  region = "us-east-2"
}

#Creates Security group in AWS
resource "aws_security_group" "allow_tls" {
  name        = "terraform_fw_rule"
  description = "Deploy security group via TF"
}

#Creates inbound rules for security group in aws
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 100
}

#Creates outbound rules for security group in aws
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
