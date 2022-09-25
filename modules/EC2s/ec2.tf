data "aws_ami" "amazon-linux" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

resource "aws_instance" "public1-ec2" {
  ami = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  key_name = "public-instance"
  vpc_security_group_ids = [var.public_security_group]
  tags = {
    Name = "public1-ec2"
  }
  subnet_id = var.public1_id

  provisioner "local-exec" {
        command = "echo ${self.public_ip} > public_ec2_id.txt"
    }
}

resource "aws_instance" "public2-ec2" {
  ami = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  key_name = "public-instance"
  vpc_security_group_ids = [var.public_security_group]
  tags = {
    Name = "public2-ec2"
  }
  subnet_id = var.public2_id
}

resource "aws_instance" "priivate1-ec2" {
  ami = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  key_name = "public-instance"
  vpc_security_group_ids = [var.private_security_group]
tags = {
    Name = "priivate1-ec2"
  }
  subnet_id = var.private1_id
}

resource "aws_instance" "priivate2-ec2" {
  ami = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  key_name = "public-instance"
  vpc_security_group_ids = [var.private_security_group]
tags = {
    Name = "priivate2-ec2"
  }
  subnet_id = var.private2_id
}