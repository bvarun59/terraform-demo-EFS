# Create a EC2 instance in Public subnet 1

resource "aws_security_group" "EFSSG" {
  vpc_id = var.subnet_id

  tags = {
    Name = "EFSsecuritygroup"
  }
 }


resource "aws_security_group_rule" "ingressrule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "http"
  cidr_blocks       = "0.0.0.0/0"
  security_group_id = aws_security_group.EFSSG.id
}

resource "aws_security_group_rule" "egressrule" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.EFSSG.id
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