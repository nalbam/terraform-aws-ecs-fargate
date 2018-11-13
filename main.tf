# ecs fargate

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "ecs-fargate.tfstate"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "ecs" {
  source = "./modules/ecs"

  region = "${var.region}"
  city   = "${var.city}"
  stage  = "${var.stage}"
  name   = "${var.name}"

  vpc_id     = ""
  cidr_block = "10.12.0.0/16"
}

output "cluster_name" {
  value = "${module.ecs.cluster_name}"
}
