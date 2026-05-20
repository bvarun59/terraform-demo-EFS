# create a VPC with cidr block
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.mvpccidr

  tags = {
    Name = var.mvpcname
  }
}

#Create a internetgateway and attch to above vpc id
resource "aws_internet_gateway" "terraform_igw" {

  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = var.migw
  }

}

#Create a Public Subnet 1

resource "aws_subnet" "terraform_s1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.ms1cidr
  availability_zone = var.ms1az

  tags = {
    Name = var.ms1name
  }
}

#Create a Public Subnet 2

resource "aws_subnet" "terraform_s2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.ms2cidr
  availability_zone = var.ms2az

  tags = {
    Name = var.ms2name
  }
}

#Create a Public Route Table for above vpc id and add routes

resource "aws_route_table" "terraform_RT" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = var.mRTallowpublic
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = var.mRT
  }
}
#Associate public subnet 1 to Publi#Asc RouteTable
resource "aws_route_table_association" "terraform_associate1" {
  subnet_id      = aws_subnet.terraform_s1.id
  route_table_id = aws_route_table.terraform_RT.id
}

#Associate public subnet 1 to Publi#Asc RouteTable
resource "aws_route_table_association" "terraform_associate2" {
  subnet_id      = aws_subnet.terraform_s2.id
  route_table_id = aws_route_table.terraform_RT.id
}