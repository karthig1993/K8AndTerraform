provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myec2" {
  ami                    = "ami-00e428798e77d38d9"
  instance_type          = "t2.micro"
  key_name               = "EC2TestKeyPair"
  vpc_security_group_ids = ["sg-086c3c41981253fc0"]


  connection {
    type        = "ssh"
    user        = "ec2_user"
    private_key = "EC2TestKeyPair"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "yum -y install nginx",
      "systemctl start nginx",
    ]
  }
}
