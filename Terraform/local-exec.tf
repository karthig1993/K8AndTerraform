provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> server_ip.txt"
  }
}
