module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block = "192.168.0.0/16"
  vpc_tenency    = "default"
  vpc_name       = "Dev-vpc"
}