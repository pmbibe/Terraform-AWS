resource "aws_subnet" "public-subnet" {
  for_each          = var.vsubnet
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = each.key
  }
}