# output

output "alb_name" {
  value = "${aws_alb.main.dns_name}"
}

output "dns_name" {
  value = "${aws_route53_record.main.*.name}"
}
