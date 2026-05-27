resource "aws_nat_gateway" "terraformNAT" {
  vpc_id            = var.vpc_id
  availability_mode = "regional"
}

# resource "aws_route" "NAT_routes" {
#   route_table_id = var.RouteTable
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id = aws_nat_gateway.terraformNAT.id
# }
