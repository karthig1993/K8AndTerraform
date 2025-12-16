provider "aws" {
  region = "us-east-2"
}

resource "aws_eip" "eip" {
  domain = "vpc"
}
