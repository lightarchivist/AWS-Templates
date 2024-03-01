terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
  
}

resource "aws_security_group" "SecurityGroupSSH" {
  name        = "SecurityGroupSSH"
  description = "Allow SSH in"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "TUDublinEC2Instance" {
  ami             = "ami-0dfcb1ef8550277af"
  instance_type   = "t2.micro"
  availability_zone = "us-east-1a"
  key_name        = "vockey"
  security_groups = [aws_security_group.SecurityGroupSSH.name]

  tags = {
    Name = "Demo_Updated"
  }
}
