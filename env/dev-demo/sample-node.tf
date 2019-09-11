# ecs fargate

module "sample_node" {
  source = "../../modules/fargate"

  region = var.region
  stage  = var.stage

  cluster_id   = module.ecs.cluster_id
  cluster_name = module.ecs.cluster_name

  vpc_id             = var.vpc_id
  subnet_public_ids  = var.subnet_public_ids
  subnet_private_ids = var.subnet_private_ids

  name    = "sample-node"
  image   = "nalbam/sample-node"
  port    = "8080"
  cpu     = "256"
  memory  = "512"
  desired = "1"
  min     = "1"
  max     = "5"

  domain      = "sample-node-${var.stage}.fargate.${var.base_domain}"
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
