variable "region" {
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_tenency" {
  default = "default"
}

variable "subnets_cidr" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

variable "igw_destination" {
  default = "0.0.0.0/0"
}

# AMI mapping with region
variable "webservers_ami" {
  type = "map"

  default = {
    us-east-1 = "ami-97785bed"
    us-west-2 = "ami-f2d3638a"
  }
}

variable "webservers_count" {
  default = 3
}
variable "key_name" {
  default = "javahome"
}

# Declare the data source for available zones
data "aws_availability_zones" "available" {}
