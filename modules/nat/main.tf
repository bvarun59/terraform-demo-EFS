resource "aws_nat_gateway" "terraformNAT" {
  vpc_id            = var.vpc_id
  availability_mode = "regional"
}