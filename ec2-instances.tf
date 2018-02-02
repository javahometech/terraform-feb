resource "aws_instance" "webservers" {
  ami = "${lookup(var.webservers_ami,var.region)}"
  key_name = "${aws_key_pair.webservers.key_name}"
  # Fix this later
  count                  = "${var.webservers_count}"
  instance_type          = "t2.micro"
  subnet_id              = "${element(aws_subnet.subnets.*.id,count.index)}"
  vpc_security_group_ids = ["${aws_security_group.webservers.id}"]
  availability_zone      = "${element(aws_subnet.subnets.*.availability_zone,count.index)}"
  user_data              = "${file("install_apache.sh")}"

  tags {
    Name = "Webserver-${count.index + 1}"
  }
}

resource "aws_key_pair" "webservers" {
  key_name   = "tfuser"
  public_key = "${file("/Users/kammana/tfuser.pub")}"
}


# resource "aws_instance" "dbserver" {
#   ami = "${lookup(var.webservers_ami,var.region)}"
#   key_name = "${aws_key_pair.webservers.key_name}"
#   instance_type          = "t2.micro"
#   user_data              = "${file("install_apache.sh")}"
#   tags {
#     Name = "Webserver-3"
#   }
# }
