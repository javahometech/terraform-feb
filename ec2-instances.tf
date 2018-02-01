resource "aws_instance" "webservers" {
  ami           = "${lookup(var.webservers_ami,var.region)}"
  # Fix this later
  count         = "${var.webservers_count}"
  instance_type = "t2.micro"
  subnet_id = "${element(aws_subnet.subnets.*.id,count.index)}"
  vpc_security_group_ids = ["${aws_security_group.webservers.id}"]
  availability_zone = "${element(data.aws_availability_zones.available.names,count.index)}"
  user_data = "${file("install_apache.sh")}"
  tags {
    Name = "Webserver-${count.index + 1}"
  }
}
