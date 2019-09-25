# ecs fargate

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "ecs-fargate.tfstate"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source = "github.com/nalbam/terraform-aws-ecs?ref=v0.12.1"

  region = var.region
  name   = var.name
}

output "cluster_id" {
  value = module.ecs.cluster_id
}

output "cluster_name" {
  value = module.ecs.cluster_name
}
