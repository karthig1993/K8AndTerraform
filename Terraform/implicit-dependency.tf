provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "test" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = "t2_micro"
  #Implicit dependency declaration
  vpc_security_group_ids = [aws_security_group.prod.id]

}

resource "aws_security_group" "prod" {
  name = "production-sg"
}
