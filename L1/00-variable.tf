variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  type = string
  default = "my-manual-vpc" 
}
variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}
variable "public_subnet_name" {
  type = string
  default = "my-public-subnet-1"
  
}
variable "public_subnet_az" {
  type = string
  default = "us-east-1a"
  
}
variable "private_subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}
variable "private_subnet_name" {
  type = string
  default = "my-private-subnet-1"
  
}
variable "private_subnet_az" {
  type = string
  default = "us-east-1a"
  
}
variable "igw_name" {
  type = string
  default = "my-igw"
  
}
variable "eip_name" {
  type = string
  default = "my-eip"
  
}
variable "nat_gateway_name" {
  type = string
  default = "my-nat-gateway"
  
}
variable "pub_route_table_name" {
  type = string
  default = "my-public-route-table"
  
}
variable "pri_route_table_name" {
  type = string
  default = "my-private-route-table"
  
}