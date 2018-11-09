# output

output "dns_name" {
  value = "${aws_alb.main.dns_name}"
}
