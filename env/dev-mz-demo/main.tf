# ecs fargate

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-mz-seoul"
    key    = "ecs-fargate.tfstate"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source = "../../modules/ecs"

  region = var.region
  city   = var.city
  stage  = var.stage
  name   = var.name
  suffix = var.suffix
}

output "cluster_name" {
  value = module.ecs.cluster_name
}
