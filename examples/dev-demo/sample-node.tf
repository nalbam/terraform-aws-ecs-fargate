# ecs fargate

module "sample_node" {
  source = "../../"

  region = var.region

  cluster_id   = data.terraform_remote_state.ecs.outputs.cluster_id
  cluster_name = data.terraform_remote_state.ecs.outputs.cluster_name

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  private_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids

  name    = "sample-node"
  stage   = "dev"
  image   = "nalbam/sample-node"
  port    = "8080"
  cpu     = "256"
  memory  = "512"
  desired = "1"
  min     = "1"
  max     = "5"

  domain      = "sample-node-dev.fargate.${var.base_domain}"
  base_domain = var.base_domain
}

output "sample_node_app_name" {
  value = module.sample_node.app_name
}

output "sample_node_alb_dns_name" {
  value = module.sample_node.alb_dns_name
}

output "sample_node_dns_name" {
  value = module.sample_node.dns_name
}
