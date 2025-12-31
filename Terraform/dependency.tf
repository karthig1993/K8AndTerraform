provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "test" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = "t2_micro"
  #EC2 instance only created after S3 bucket is created
  depends_on = [aws_s3_bucket.test_bucket]
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "karthig_test_bucket_dependency"
}
