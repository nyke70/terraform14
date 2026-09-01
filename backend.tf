terraform {
  backend "s3" {
    bucket = "terraform-sk-do-not-delete"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}
