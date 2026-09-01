variable "vpc-cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "region_name" {
  default     = "us-east-1"
}