provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = "t2_micro"

  tags = {
    Name = "test_instance"
  }

  lifecycle {
    prevent_destroy = true
  }
}
