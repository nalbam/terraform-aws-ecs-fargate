# ecs job

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "ecs-job.tfstate"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "job" {
  source = "../../modules/job"

  region = var.region
  stage  = var.stage

  cluster_id = "arn:aws:ecs:ap-northeast-2:968005369378:cluster/seoul-dev-demo-cluster"

  vpc_id             = var.vpc_id
  subnet_public_ids  = var.subnet_public_ids
  subnet_private_ids = var.subnet_private_ids

  name   = "builder-${random_string.suffix.result}"
  image  = "opspresso/builder"
  port   = "80"
  cpu    = "200"
  memory = "512"
}

output "job_name" {
  value = module.job.app_name
}

resource "random_string" "suffix" {
  length = 8
}
