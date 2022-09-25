module "iti_network" {
  source="/home/kero/terraform/network"
    vpc_cidr=var.vpc_cidr
    vpc_region = var.vpc_region # "eu-central-1"
    public_subnet1_cidr = var.public_subnet1_cidr #"10.0.1.0/24"
    public_subnet2_cidr = var.public_subnet2_cidr # "10.0.3.0/24"
    private_subnet1_cidr = var.private_subnet1_cidr # "10.0.2.0/24"
    private_subnet2_cidr = var.private_subnet2_cidr # "10.0.4.0/24"
    av_zone1 = var.av_zone1
    av_zone2 = var.av_zone2
}