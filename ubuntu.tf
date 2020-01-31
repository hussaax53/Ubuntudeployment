provider "aws" {
  version = "~> v2.7.0"
  profile    = "default"
  region     = "us-east-2"

}

resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")

}

resource "aws_instance" "example2" {
  ami         = "ami-0d5d9d301c853a04a"
  instance_type = "t2.medium"
  key_name = aws_key_pair.deployer.key_name
  user_data = file("ubuntudevopstools.sh")

}
