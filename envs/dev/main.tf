module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block = "192.168.0.0/16"
  vpc_tenency    = "default"
  vpc_name       = "Dev-vpc"
}

module "frontend" {
  source                    = "../../modules/frontendaws"
  bucket_name               = "frontend.nyke.it.com"
  aws_origin_access_control = "Cross access from CloudFront "
  cert_domain               = "*.nyke.it.com"
  dns_record                = "frontend.nyke.it.com"
  hosted_zone_name          = "nyke.it.com"

}