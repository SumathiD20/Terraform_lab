module "VPC" {
  source = "./modules/vpc"
  VpcCidrparamBlock = var.VpcCidrparamBlock
  PublicSubnetCidrBlock = var.PublicSubnetCidrBlock
  PrivateSubnetCidrBlock = var.PrivateSubnetCidrBlock
  

}

module "EC2" {
    source = "./modules/ec2"
    KeyNameEC2 = var.KeyNameEC2
    InstanstanceType = var.InstanstanceType
    ami_id = var.ami_id
    region = var.region
    vpc_id = module.VPC.VpcId
    public_subnet = module.VPC.PublicSubnet
    private_subet = module.VPC.PrivateSubnet
  }