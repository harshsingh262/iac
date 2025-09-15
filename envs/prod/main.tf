terraform {
  required_version = ">= 1.0.0"
}

variable "aws_region" {
  type = string
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"
  name = var.name
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs = var.azs
}

module "ec2" {
  source = "../../modules/ec2"
  name = var.name
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_ids[0]
  ami = var.ami
  instance_type = var.instance_type
  allowed_ssh_cidrs = var.allowed_ssh_cidrs
}

module "rds" {
  source = "../../modules/rds"
  name = var.name
  subnet_ids = module.vpc.private_subnet_ids
  allocated_storage = var.db_allocated_storage
  engine = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class
  db_name = var.db_name
  username = var.db_username
  password = var.db_password
  security_group_ids = var.db_security_group_ids
}

output "vpc_id" { value = module.vpc.vpc_id }
output "ec2_public_ip" { value = module.ec2.public_ip }
output "rds_endpoint" { value = module.rds.endpoint }
