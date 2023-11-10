terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
locals {
  region = "ap-southeast-1"
}

provider "aws" {
  region = local.region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_region = local.region
}

module "ssh_key" {
  source    = "./modules/ssh_key"
  ssh_key_name = "mykey"
  public_key = "AA"

}

module "EC2" {
  source    = "./modules/EC2"
  vpc_id = module.vpc.id
  public_subnet_id = module.vpc.vpc_public_subnet.id
  key_name   = module.ssh_key.key_name
}