# RDS instance
resource "aws_db_instance" "default" {
  allocated_storage    = "${var.storage}"
  storage_type         = "${var.storage_type}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.db_name}"
  username             = "${var.db_user_name}"
  password             = "${var.db_password}"
}
