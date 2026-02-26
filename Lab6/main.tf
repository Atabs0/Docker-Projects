terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}


# EC2 Instance
resource "aws_instance" "nginx_instance" {
  ami                    = "ami-0f3caa1cf4417e51b" # Amazon Linux 2 AMI (us-east-1, update if in anotherregion)
  instance_type          = "t2.micro"
  key_name               = var.key_name # Use the key name from variables.tf
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  user_data              = <<-EOF
#!/bin/bash
dnf update -y
dnf install docker -y
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 nginx
EOF
  tags = {
    Name = "nginx-docker-instance"
  }
}
