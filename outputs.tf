output "vpcname" {
  value = module.vpccreation.vpcname
}

output "vpc_id" {
  value = module.vpccreation.vpcname.id
  
}

output "subnet1" {
  value = module.vpccreation.subnet1
}

output "subnet2" {
  value = module.vpccreation.subnet2

}

output "internetgatway" {
  value = module.vpccreation.internetgatway
}

output "RouteTable" {
  value = module.vpccreation.RouteTable
}

output "RT-Associates1" {
  value = module.vpccreation.RT-Associates1

}

output "RT-Associate2" {
  value = module.vpccreation.RT-Associate2

}

output "addedroutes" {
  value = module.vpccreation.addedroutes

}

output "ec2Creation1" {
  value = module.ec2Creation1.moutputpublicip

}

output "ec2Creation2" {
  value = module.ec2Creation2.moutputpublicip

}
