resource "aws_route_table_association" "ass-1" {
  for_each = var.vsubnet
  subnet_id = aws_subnet.public-subnet[each.key].id
  route_table_id = aws_route_table.router-1.id
}
