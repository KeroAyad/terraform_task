output "vpc_id" {
    value = aws_vpc.terraform.id
}

output "public_security_group" {
    value = aws_security_group.public_security_group.id
}

output "private_security_group" {
    value = aws_security_group.private_security_group.id
}

output "public1_id" {
    value = aws_subnet.public1.id
}

output "public2_id" {
    value = aws_subnet.public2.id
}
output "private1_id" {
    value = aws_subnet.private1.id
}

output "private2_id" {
    value = aws_subnet.private2.id
}