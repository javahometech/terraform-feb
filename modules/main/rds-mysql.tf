module "mysql_insrance" {
  source = "../rds"
  storage = 25
  storage_type = "${var.storage_type}"
  engine = "mysql"
  engine_version = "5.6.37"
  instance_class = "db.t2.micro"
  db_name = "javahomedb"
  # db_user_name = "javahome"
  db_password  = "javahome"
}
