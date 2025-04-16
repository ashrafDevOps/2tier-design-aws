module "virtual_network" {
  source = "./Modules/virtual_network"

  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                = ["us-east-1a", "us-east-1b"]
  enable_nat_gateway = true
}

data "aws_key_pair" "ec2-key-pair" {
  key_name           = "ec2-terraform"
  include_public_key = true
}

module "instances" {
  source = "./Modules/instances"

  # Basic configuration
  ami_id        = "ami-03b14d3ee80a8f052"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.ec2-key-pair.key_name
  key_path      = "home/ashraf/c2-terraform.pem"
  resource_name = "Public-ec2"

  # Bastion configuration
  create_bastion         = true
  bastion_instance_count = 2
  public_subnet_ids      = module.virtual_network.public_subnet_ids
  bastion_sg_id          = module.security_groups.sg-id
  load_blancer_dns       = module.load_balencer_private.lb_dns_name

  # Private instances configuration
  create_private         = true
  private_instance_count = 2
  private_subnet_ids     = module.virtual_network.private_subnet_ids
  private_sg_id          = module.security_groups.sg-id
}


module "load_balencer" {
  source               = "./Modules/load_balencer"
  lb_name              = "project-alb-ashraf-Public"
  tg_name              = "project-tg-public"
  vpc_id               = module.virtual_network.vpc_id
  public_subnets       = module.virtual_network.public_subnet_ids
  lb_sg_id             = module.security_groups.sg-id
  backend_instance_ids = module.instances.instance_ids
  Is_private           = false

}


module "load_balencer_private" {
  source               = "./Modules/load_balencer"
  lb_name              = "project-alb-ashraf-private"
  tg_name              = "project-tg-private"
  vpc_id               = module.virtual_network.vpc_id
  public_subnets       = module.virtual_network.private_subnet_ids
  lb_sg_id             = module.security_groups.sg-id
  backend_instance_ids = module.instances.private_instance_ids
  Is_private           = true

}


module "security_groups" {
  source     = "./Modules/security_group"
  vpc_id     = module.virtual_network.vpc_id
  depends_on = [module.virtual_network]
}

