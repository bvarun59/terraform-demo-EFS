#Provider of cloud
provider "aws" {
    region = ap-south-1
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
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet-1"
  }
}

#Create a Public Subnet 2

resource "aws_subnet" "terraform_s2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Public-Subnet-2"
  }
}

#Create a Public Route Table and add routes and Associate Public subnet

