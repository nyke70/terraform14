module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block = "172.120.0.0/16"
  vpc_tenency    = "default"
  vpc_name       = "Prod-vpc"
}
module "s3" {
  source = "../../modules/s3"

  s3_bucket_name      = "terraform-prod-bucket"
  s3_bucket_tags_name = "Prod-bucket"
}