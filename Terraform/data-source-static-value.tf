provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ami_test" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-jammy-22.04-arm64-minimal-*"]
  }
}

resource "aws_instance" "test_ec2" {
  ami           = data.aws_ami.ami_test.image_id
  instance_type = "t2.micro"
}

