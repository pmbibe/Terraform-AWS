resource "aws_eip" "eip" {
  tags = {
    Name = var.eip_name
  }

}
resource "aws_nat_gateway" "nat_gateway" {
  tags = {
    Name = var.nat_gateway_name
  }
  subnet_id     = aws_subnet.public-subnet.id
  allocation_id = aws_eip.eip.id
  depends_on    = [aws_internet_gateway.internet_gateway]
}
