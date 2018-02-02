resource "aws_internet_gateway" "javahome_igw" {
  vpc_id = "${aws_vpc.javahome_vpc.id}"

  tags {
    Name = "javahome_igw"
  }
}

# Route table for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.javahome_vpc.id}"

  route {
    cidr_block = "${var.igw_destination}"
    gateway_id = "${aws_internet_gateway.javahome_igw.id}"
  }

  tags {
    Name = "javahome_vpc_public_route_table"
  }
}

# Subnet associations

resource "aws_route_table_association" "a" {
  count          = "${length(var.subnets_cidr)}"
  subnet_id      = "${element(aws_subnet.subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.public_rt.id}"
}
