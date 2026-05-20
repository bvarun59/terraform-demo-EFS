variable "gvpccidr" {
  default = "10.0.0.0/16"
  type    = string
}
variable "gvpcname" {
  default = "demoefsvpc"
  type    = string
}
variable "gigw" {
  default = "demoefsigw"
  type    = string
}
variable "gs1cidr" {
  default = "10.0.0.0/24"
  type    = string
}
variable "gs1az" {
  default = "us-east-1a"
  type    = string
}
variable "gs1name" {
  default = "Public-EFS-1"
  type    = string
}
variable "gs2cidr" {
  default = "10.0.3.0/24"
  type    = string
}
variable "gs2az" {
  default = "us-east-1b"
  type    = string
}
variable "gs2name" {
  default = "Public-EFS-2"
  type    = string
}
variable "gRT" {
  default = "Public-EFS-RT"
  type    = string
}
variable "gRTallowpublic" {
  default = "0.0.0.0/0"
  type    = string
}

variable "gamiid" {
  default = "ami-0236922087fa98b6e"
  type    = string
}
variable "ginstatype" {
  default = "t3.micro"
  type    = string
}
variable "giamprofile" {
  default = "ec2-ssm"
  type    = string
}
