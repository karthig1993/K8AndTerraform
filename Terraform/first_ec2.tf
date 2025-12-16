provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = "t2.micro"

  tags = {
    Name = "my-first-ec2"
  }
}
