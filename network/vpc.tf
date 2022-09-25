resource "aws_vpc" "terraform" {
    cidr_block = var.vpc_cidr #"10.0.0.0/16"
    tags = {
    Name = "main"
    }
    provisioner "local-exec" {
        command = "echo ${self.id} > provisioner.txt"
    }
}