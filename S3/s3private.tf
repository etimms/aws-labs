provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "tfbucket" {
  bucket = "eamonstestbucket2"
  acl    = "private"
}
