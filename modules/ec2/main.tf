# Create a EC2 instance in Public subnet 1

resource "aws_security_group" "EFSSG" {
  vpc_id = var.subnet_id

  tags = {
    Name = "EFSsecuritygroup"
  }
 }


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.EFSSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "http"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.EFSSG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "ec2" {
  ami                  = var.mamiid
  instance_type        = var.minstatype
  iam_instance_profile = var.miamprofile
  subnet_id            = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = var.instancename
  }

}