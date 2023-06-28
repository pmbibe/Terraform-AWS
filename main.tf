provider "aws" {
  region = "us-east-2"
  access_key = var.auth.access_key
  secret_key = var.auth.secret_key
}
variable "auth" {
}
variable "subnet_prefix" { 
  description = "CIDR block for the subnet"
  type = string
}
resource "aws_vpc" "ptmduc-main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Prod"
    }    
}
resource "aws_internet_gateway" "ptmduc-gw" {
    vpc_id = aws_vpc.ptmduc-main.id
    tags = {
        Name = "Prod"
    }    
}
resource "aws_route_table" "ptmduc-routetable" {
    vpc_id = aws_vpc.ptmduc-main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ptmduc-gw.id
    }
    tags = {
        Name = "Prod"
    }
}
resource "aws_subnet" "ptmduc-subnet-1" {
    vpc_id = aws_vpc.ptmduc-main.id
    cidr_block = var.subnet_prefix
    availability_zone = "us-east-2a"
    tags = {
        Name = "Prod"
    }
}
resource "aws_route_table_association" "ptmduc-a" {
    subnet_id = aws_subnet.ptmduc-subnet-1.id
    route_table_id = aws_route_table.ptmduc-routetable.id
}
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.ptmduc-main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web"
  }
}
resource "aws_network_interface" "ptmduc-eni" {
    subnet_id = aws_subnet.ptmduc-subnet-1.id
    private_ips = ["10.0.1.50"]
    security_groups = [aws_security_group.allow_web.id]
}
resource "aws_eip" "lb" {
  vpc      = true
  network_interface = aws_network_interface.ptmduc-eni.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_internet_gateway.ptmduc-gw]
}
resource "aws_instance" "ptmduc-webserver" {
  ami = "ami-089c6f2e3866f0f14"
  instance_type = "t2.micro"
  availability_zone = "us-east-2a"
  key_name = "ducpham"
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.ptmduc-eni.id
  }
  # user_data = <<-EOF
  #           #!/bin/bash
  #           sudo yum -y install git
  #           EOF
  tags = {
    Name = "Web-server"
  }
}