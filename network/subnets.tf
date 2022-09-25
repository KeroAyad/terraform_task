resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.public_subnet1_cidr #"10.0.1.0/24"
  availability_zone = var.av_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.public_subnet2_cidr #"10.0.3.0/24"
  availability_zone = var.av_zone2
  map_public_ip_on_launch = true
  tags = {
    Name = "public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.private_subnet1_cidr #"10.0.2.0/24"
  availability_zone = var.av_zone1

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.private_subnet2_cidr #"10.0.4.0/24"
  availability_zone = var.av_zone2

  tags = {
    Name = "private2"
  }
}