resource "aws_security_group" "public_security_group" {
  name        = "allow-ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.terraform.id

  ingress {
    description      = "ssh from all"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "private_security_group" {
  name        = "ssh-from-vpc"
  description = "Allow ssh inbound traffic from vpc and all from port 3000"
  vpc_id      = aws_vpc.terraform.id

  ingress {
    description      = "ssh from vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.terraform.cidr_block]
  }

ingress {
    description      = "ssh from all"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.terraform.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-from-vpc"
  }
}