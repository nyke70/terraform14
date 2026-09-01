resource "aws_instance" "web" {
  ami                                  = "ami-0332d564d76dbd8d6"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1d"
  instance_type                        = "t3.micro"
  key_name                             = "kevin-key"
  security_groups                      = ["launch-wizard-1"]
  source_dest_check                    = true
  subnet_id                            = "subnet-073777e3c655aca9e"
  tags = {
    Name = "dev-app-server-test"
  }
  tags_all = {
    Name = "dev-app-server"
  }
}
