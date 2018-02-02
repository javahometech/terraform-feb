output "public_ips_webservers"{
  value = "${aws_instance.webservers.*.public_ip}"
}

output "elb_dns_name"{
  value = "${aws_elb.javahome_elb.dns_name}"
}
