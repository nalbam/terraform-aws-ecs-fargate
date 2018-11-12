# ecs fargate

provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "ecs-fargate.tfstate"
  }
}

module "ecs" {
  source = "./modules/ecs"

  region = "ap-northeast-2"
  city   = "SEOUL"
  stage  = "DEV"
  name   = "DEMO"

  vpc_id     = ""
  cidr_block = "10.12.0.0/16"
}

output "cluster_name" {
  value = "${module.ecs.cluster_name}"
}
