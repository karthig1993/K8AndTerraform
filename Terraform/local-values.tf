provider "aws" {
  region = "us-east-2"
}

locals {
  default = {
    Team         = "developer-team"
    CreationDate = "date-${formatdate("DD MMM YYYY", timestamp())}"
  }
}

resource "aws_security_group" "test-group-1" {
  name = "app-firewall"
  tags = local.default
}

resource "aws_security_group" "test-group-2" {
  name = "db-firewall"
  tags = local.default
}
