module "Networking"{
    source = "./Networking"
    cidr = var.cidr
    public_1_cidr = var.public_subnet_1_cidr
    public_2_cidr = var.public_subnet_2_cidr
    private_1_cidr = var.private_subnet_1_cidr
    private_2_cidr = var.private_subnet_2_cidr
}

module "Compute"{
    source = "./Compute"
    instance-type = var.instance-type
    vpc_id = module.Networking.myvpc-id
    vpc_cidr_block = module.Networking.myvpc-cidr_block
    public_subnet_id = module.Networking.public_subnet_1_id
    Private_subnet_id = module.Networking.private_subnet_1_id
}