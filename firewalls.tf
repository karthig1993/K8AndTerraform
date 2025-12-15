provider "aws" {
  region = "us-east-2"
}

#Creates Security group in AWS
resource "aws_security_group" "allow_tls" {
  name        = "terraform_fw_rule"
  description = "Deploy security group via TF"
}
