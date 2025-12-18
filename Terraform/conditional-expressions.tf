provider "aws" {
  region = "us-east-2"
}

variable "environment" {
  type = string

  default = "development"
}

variable "region" {
  type = string

  default = "us-east-2"
}

resource "aws_instance" "prod_instance" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = var.environment != "development" ? "t2.micro" : "t2.nano"
}

resource "aws_instance" "dev_instance" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = var.environment == "development" ? "t2.micro" : "t2.nano"
}

resource "aws_instance" "multiple_condition" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = var.environment == "development" || var.region == "us-east-1" ? "t2.micro" : "t2.nano"
}
