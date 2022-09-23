resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = "gw-internet"
  }
}

#elastic ip for NAT
resource "aws_eip" "lb" {
  tags = {
    "Name" = "eip-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  connectivity_type = "public"
  allocation_id = aws_eip.lb.id
  subnet_id = aws_subnet.public1.id

  tags = {
    Name = "gw-nat"
  }

  depends_on = [aws_internet_gateway.internet]
}