variable "aws_access_key" {
  default = "ASIAX7HMF2FXE5LZXXBR"
}
variable "aws_secret_key" {
  default = "DC3A2Og+AnVamFUMAr+MKIJ4nMgR7iPADC5E+gwx"
}
variable "aws_token" {
  default = "FwoGqPjuvWRrmVGhXuR0ieVYfwJVPwYbAd1"
}
variable "aws_region" {
  default = "us-east-1"
}
variable "amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-04505e74c0741db8d"
  }
}
variable "private_key_name" {
  default = "aws-private"
}
variable "path_to_private_key" {
  default = "aws-private.pem"
}
variable "path_to_public_key" {
  default = "aws-private.pub"
}
variable "instance_username" {
  default = "ubuntu"
}
variable "aws_security_group" {
  default = "web_traffic"
}
variable "host_file" {
  default = "hosts"
}
variable "instance_count" {
  default = "2"
