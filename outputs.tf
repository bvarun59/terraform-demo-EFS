output "vpcname" {
  value = aws_vpc.terraform_vpc.id
}

output "subnet1" {
  value = aws_subnet.terraform_s1.cidr_block
}

output "subnet2" {
  value = aws_subnet.terraform_s2.cidr_block

}

output "internetgatway" {
  value = aws_internet_gateway.terraform_igw.id
}

output "RouteTable" {
  value = aws_route_table.terraform_RT.id

}

output "RT-Associates1" {
  value = aws_route_table_association.terraform_associate1.id

}

output "RT-Associate2" {
  value = aws_route_table_association.terraform_associate2.id

}

output "addedroutes" {
  value = aws_route_table.terraform_RT.route
  
}
