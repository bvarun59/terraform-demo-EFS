#Provider of cloud
provider "aws" {
  region = "ap-south-1"
}

# create a VPC with cidr block
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tvpc"
  }
}

#Create a internetgateway and attch to above vpc id
resource "aws_internet_gateway" "terraform_igw" {

  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "tigw"
  }

}

#Create a Public Subnet 1

resource "aws_subnet" "terraform_s1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Public-Subnet-1"
  }
}

#Create a Public Subnet 2

resource "aws_subnet" "terraform_s2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Public-Subnet-2"
  }
}

#Create a Public Route Table for above vpc id and add routes

resource "aws_route_table" "terraform_RT" {
  vpc_id = aws_vpc.terraform_vpc.id


  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  route {
    cidr_block             = "0.0.0.0/0"
    egress_only_gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = "tRT"
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


# Create a EC2 instance in Public subnet 1

resource "aws_instance" "ec2-1" {
  ami                  = "ami-09ed39e30153c3bf9"
  instance_type        = "t3.small"
  iam_instance_profile = "ec2-ssm"
  subnet_id            = aws_subnet.terraform_s1.id

  tags = {
    Name = "firstinstance"
  }

}

# Create a EC2 instance in Public subnet 1

resource "aws_instance" "ec2-2" {
  ami                  = "ami-09ed39e30153c3bf9"
  instance_type        = "t3.small"
  iam_instance_profile = "ec2-ssm"
  subnet_id            = aws_subnet.terraform_s2.id

  tags = {
    Name = "secondinstance"
  }
}




