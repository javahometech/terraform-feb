variable "region" {
  type = "string"
  default = "us-west-2"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "vpc_tenency" {
  default = "default"
}
variable "subnets_cidr" {
  type = "list"
  default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "igw_destination" {
  default = "0.0.0.0/0"
}
