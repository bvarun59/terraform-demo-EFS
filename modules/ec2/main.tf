# Create a EC2 instance in Public subnet 1

resource "aws_security_group" "EFSSG" {
  vpc_id = var.vpc_id
  name = var.EFSsecuritygroup
  ingress = [ 
    {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "http"
    from_port = 80
    protocol = "http"
  #  security_groups = [ "value" ]
    to_port = 80
  },
   {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
     {
      description = "app port"
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
     {
      description = "https"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
   ]

  egress = [ 
    {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow to public from inside"
    from_port = 0
    protocol = "-1"
    self = false
    to_port = 0
  }
   ]
  tags = {
    Name = var.EFSsecuritygroup
  }
 }

# resource "aws_security_group_rule" "ingressrulenodeexporter" {
#   type              = "ingress"
#   from_port         = 9100
#   to_port           = 9100
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.EFSSG.id
# }

# resource "aws_security_group_rule" "ingressruleprometheus" {
#   type              = "ingress"
#   from_port         = 9090
#   to_port           = 9090
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.EFSSG.id
# }

# resource "aws_security_group_rule" "ingressrulegrafana" {
#   type              = "ingress"
#   from_port         = 3000
#   to_port           = 3000
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.EFSSG.id
# }

# resource "aws_security_group_rule" "egressrule" {
#   type              = "egress"
#   to_port           = 0
#   protocol          = "-1"
#   from_port         = 0
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.EFSSG.id
# }


resource "aws_instance" "ec2" {
  ami                  = var.mamiid
  instance_type        = var.minstatype
  iam_instance_profile = var.miamprofile
  subnet_id            = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.EFSSG.id]
  user_data_base64 = filebase64("${path.module}/setup.sh")
  #security_groups = [aws_security_group.EFSSG.id]

  tags = {
    Name = var.instancename
  }

}

