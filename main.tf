module "iti_network" {
  source="/home/kero/terraform/modules/network"
    vpc_cidr=var.vpc_cidr
    vpc_region = var.vpc_region # "eu-central-1"
    public_subnet1_cidr = var.public_subnet1_cidr #"10.0.1.0/24"
    public_subnet2_cidr = var.public_subnet2_cidr # "10.0.3.0/24"
    private_subnet1_cidr = var.private_subnet1_cidr # "10.0.2.0/24"
    private_subnet2_cidr = var.private_subnet2_cidr # "10.0.4.0/24"
    av_zone1 = var.av_zone1
    av_zone2 = var.av_zone2
}
module "iti_ec2s" {
    source = "/home/kero/terraform/modules/EC2s"
    # depends_on = [
    #   module.iti_network
    # ]
    vpc_id = module.iti_network.vpc_id
    public1_id = module.iti_network.public1_id
    public2_id = module.iti_network.public2_id
    private1_id = module.iti_network.private1_id
    private2_id = module.iti_network.private2_id
    public_security_group = module.iti_network.public_security_group
    private_security_group = module.iti_network.private_security_group
}
# module "message_notification" {
#   source = "/home/kero/terraform/message_notification"
# }