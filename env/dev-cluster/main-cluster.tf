# ecs fargate

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "ecs-cluster.tfstate"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "ecs" {
  source = "../../modules/ecs"

  region = "${var.region}"
  city   = "${var.city}"
  stage  = "${var.stage}"
  name   = "${var.name}"
  suffix = "${var.suffix}"

  # vpc_id     = ""
  # subnet_ids = []
  vpc_cidr = "10.21.0.0/16"
}

output "cluster_id" {
  value = "${module.ecs.cluster_id}"
}

output "cluster_name" {
  value = "${module.ecs.cluster_name}"
}

output "vpc_id" {
  value = "${module.ecs.vpc_id}"
}

output "subnet_public_ids" {
  value = "${module.ecs.subnet_public_ids}"
}

output "subnet_private_ids" {
  value = "${module.ecs.subnet_private_ids}"
}
