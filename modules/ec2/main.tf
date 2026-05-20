# Create a EC2 instance in Public subnet 1

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