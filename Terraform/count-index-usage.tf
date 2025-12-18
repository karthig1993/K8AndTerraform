provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2counts" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = "t2.micro"
  count         = 3

  tags = {
    Name = "testing-instance-count-${count.index}"
  }
}

resource "aws_iam_user" "user_counts" {
  name  = "testing-user-${count.index}"
  count = 3

}

variable "users" {
  type    = list(any)
  default = ["test1", "test2", "test3"]
}

resource "aws_iam_user" "test_user_list" {
  name  = "var.users${count.index}"
  count = 3
}

