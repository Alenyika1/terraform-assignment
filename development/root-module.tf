module "EC2_Instance" {
  source            = "../child-modules/EC2-Instance"
  instance_name     = "vm-west1"
  instance_ami      = "ami-0694d931cee176e7d"
  ec2_instance_type = "t2.micro"
  key_name          = "key-pair"
  key_filename      = "/home/ubuntu/.ssh/id_rsa"
  security_name     = "security-west"
  vpc_id_id         = module.network.vpc_id_id
  private_subnet_id = module.network.private_subnet_id
  public_subnet_id  = module.network.public_subnet_id
  environment       = "dev"
}

module "network" {
  source        = "../child-modules/network"
  environment   = "dev"
  vpc_name      = "VPC-west"
  cidr_block    = "192.56.0.0/16"
  public_subnet = "192.56.1.0/24"
  private_subnet = "192.56.2.0/24"
}
