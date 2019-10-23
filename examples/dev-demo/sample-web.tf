# ecs fargate

module "sample_web" {
  source = "../../"

  region = var.region

  cluster_id   = data.terraform_remote_state.ecs.outputs.cluster_id
  cluster_name = data.terraform_remote_state.ecs.outputs.cluster_name

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  private_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids

  name    = "sample-web"
  stage   = "dev"
  image   = "nalbam/sample-web"
  port    = "80"
  cpu     = "256"
  memory  = "512"
  desired = "1"
  min     = "1"
  max     = "5"

  domain      = "sample-web-dev.fargate.${var.base_domain}"
  base_domain = var.base_domain
}

output "sample_web_app_name" {
  value = module.sample_web.app_name
}

output "sample_web_alb_dns_name" {
  value = module.sample_web.alb_dns_name
}

output "sample_web_dns_name" {
  value = module.sample_web.dns_name
}
