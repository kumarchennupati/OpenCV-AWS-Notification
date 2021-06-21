provider "aws" {
	region = "us-east-1"
	profile = "default"
}

resource "aws_instance" "i1" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
}

resource "aws_ebs_volume" "v1" {
  availability_zone = "us-east-1a"
  size              = 5
}

resource "aws_volume_attachment" "a1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.v1.id
  instance_id = aws_instance.i1.id
}