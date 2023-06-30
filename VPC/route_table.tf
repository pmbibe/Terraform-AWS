resource "aws_route_table" "router-1" {
    vpc_id = aws_vpc.vpc.id
    route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.ig.id
        }

    tags = {
      Name = var.vroute_table["name"]
    } 
}
