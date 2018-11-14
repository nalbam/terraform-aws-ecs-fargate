# outputs

output "app_name" {
  value = "${aws_ecs_service.app.name}"
}

output "alb_dns_name" {
  value = "${aws_alb.app.dns_name}"
}

output "dns_name" {
  value = "${aws_route53_record.app.*.name}"
}
