# ecs job

module "job" {
  source = "../../modules/job"

  region = var.region

  cluster_id = module.ecs.cluster_id

  vpc_id             = var.vpc_id
  subnet_public_ids  = var.subnet_public_ids
  subnet_private_ids = var.subnet_private_ids

  name   = "builder"
  stage  = "dev"
  image  = "opspresso/builder"
  port   = "80"
  cpu    = "200"
  memory = "512"
}

output "job_name" {
  value = module.job.app_name
}
