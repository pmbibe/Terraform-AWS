resource "aws_vpc" "vpc" {
  cidr_block           = var.vvpc["cidr"]
  instance_tenancy     = var.vvpc["instance_tenancy"]
  enable_dns_support   = var.vvpc["enable_dns_support"]
  enable_dns_hostnames = var.vvpc["enable_dns_hostnames"]
  tags = {
    Name = var.vvpc["name"]
  }
}
