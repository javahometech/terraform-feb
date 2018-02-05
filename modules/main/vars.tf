variable "region" {
  default = "us-west-2"
}

variable "storage" {
  default = "20"
}
variable "storage_type" {
  default = "gp2"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "5.6.17"
}
variable "instance_class" {
  default = "db.t1.micro"
}
variable "db_name" {
  default = "javahome-db"
}
variable "db_user_name" {
  default = "admin"
}
variable "db_password" {
  default = "hari@1234"
}
