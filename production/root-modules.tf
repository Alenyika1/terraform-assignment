module "EC2_Instance" {
  source            = "../child-modules/EC2-Instance"
  instance_name     = "VM-2"
  instance_ami      = "ami-06dd92ecc74fdfb36"
  ec2_instance_type = "t2.micro"
  key_name          = "mykeypair"
  key_filename      = "/home/ubuntu/.ssh/id_rsa"
  security_name     = "security-cent"
  vpc_id_id         = module.network.vpc_id_id
  private_subnet_id = module.network.private_subnet_id
  public_subnet_id  = module.network.public_subnet_id
  environment       = "prod"
}

module "network" {
  source        = "../child-modules/network"
  environment   = "prod"
  cidr_block    = "10.56.0.0/16"
  vpc_name      = "VPC-Central"
  public_subnet = "10.56.1.0/24"
  private_subnet = "10.56.2.0/24"
}
