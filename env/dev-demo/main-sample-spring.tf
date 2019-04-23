# ecs fargate

module "sample_spring" {
  source = "../../modules/fargate"

  region = "${var.region}"
  stage  = "${var.stage}"

  cluster_id         = "${module.ecs.cluster_id}"
  cluster_name       = "${module.ecs.cluster_name}"
  vpc_id             = "${module.ecs.vpc_id}"
  subnet_public_ids  = "${module.ecs.subnet_public_ids}"
  subnet_private_ids = "${module.ecs.subnet_private_ids}"

  name    = "sample-spring"
  image   = "nalbam/sample-spring"
  port    = "8080"
  cpu     = "512"
  memory  = "1024"
  desired = "1"
  min     = "1"
  max     = "5"

  base_domain = "${var.base_domain}"
}

output "sample_spring_app_name" {
  value = "${module.sample_spring.app_name}"
}

output "sample_spring_alb_dns_name" {
  value = "${module.sample_spring.alb_dns_name}"
}

output "sample_spring_dns_name" {
  value = "${module.sample_spring.dns_name}"
}
