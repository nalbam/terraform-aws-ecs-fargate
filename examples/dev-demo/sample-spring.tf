# ecs fargate

module "sample_spring" {
  source = "../../"

  region = var.region

  cluster_id   = data.terraform_remote_state.ecs.outputs.cluster_id
  cluster_name = data.terraform_remote_state.ecs.outputs.cluster_name

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  private_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids

  name    = "sample-spring"
  stage   = "dev"
  image   = "nalbam/sample-spring"
  port    = "8080"
  cpu     = "512"
  memory  = "1024"
  desired = "1"
  min     = "1"
  max     = "5"

  domain      = "sample-spring-dev.fargate.${var.base_domain}"
  base_domain = var.base_domain
}

output "sample_spring_app_name" {
  value = module.sample_spring.app_name
}

output "sample_spring_alb_dns_name" {
  value = module.sample_spring.alb_dns_name
}

output "sample_spring_dns_name" {
  value = module.sample_spring.dns_name
}
