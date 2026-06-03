# VPC Network creation
module "vpccreation" {
  source         = "./modules/vpc"
  mvpccidr       = var.gvpccidr
  mvpcname       = var.gvpcname
  migw           = var.gigw
  ms1cidr        = var.gs1cidr
  ms1az          = var.gs1az
  ms1name        = var.gs1name
  ms2cidr        = var.gs2cidr
  ms2az          = var.gs2az
  ms2name        = var.gs2name
  mRT            = var.gRT
  mRTallowpublic = var.gRTallowpublic
  nat            = module.nat.nat
}


#Create instances in VPC

module "ec2Creation1" {
  source           = "./modules/ec2"
  mamiid           = var.gamiid
  minstatype       = var.ginstatype
  miamprofile      = var.giamprofile
  subnet_id        = module.vpccreation.subnet1id
  instancename     = "firstserver"
  vpc_id           = module.vpccreation.vpc_id
  EFSsecuritygroup = "ec21"
}


module "ec2Creation2" {
  source           = "./modules/ec2"
  mamiid           = var.gamiid
  minstatype       = var.ginstatype
  miamprofile      = var.giamprofile
  subnet_id        = module.vpccreation.subnet2id
  instancename     = "secondserver"
  vpc_id           = module.vpccreation.vpc_id
  EFSsecuritygroup = "ec22"

}

module "ec2Creation3" {
  source           = "./modules/ec2"
  mamiid           = var.gamiid
  minstatype       = var.ginstatype
  miamprofile      = var.giamprofile
  subnet_id        = module.vpccreation.subnet2id
  instancename     = "thirdserver"
  vpc_id           = module.vpccreation.vpc_id
  EFSsecuritygroup = "ec23"

}


module "nat" {
  source     = "./modules/nat"
  vpc_id     = module.vpccreation.vpc_id
  RouteTable = module.vpccreation.RouteTable

}




