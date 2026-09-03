variable "bucket_name" {
  description = "Bucket Name"
}
variable "aws_origin_access_control" {
  
}

variable "cloudfront_default_distribution" {
  default = "index.html"
}
variable "cloudfront_origin_id" {
  default = "S3-terraform.nyke.it.com"
}
variable "dns_record" {}
variable "cert_domain" {
  default = "*.nyke.it.com"
}
variable "hosted_zone_name" {
}