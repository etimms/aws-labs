provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "ap-southeast-2"
}

resource "aws_instance" "myt2micro" {
  count         = 2
  ami           = "ami-02d039674ab9ba947"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }

  tags {
    Name = "etEC2-${count.index}"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

resource "aws_s3_bucket" "name" {}
