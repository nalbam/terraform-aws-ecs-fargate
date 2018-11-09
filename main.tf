# ecs fargate

provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key = "ecs-fargate.tfstate"
  }
}

module "fargate" {
  source      = "./modules/fargate"
  region      = "ap-northeast-2"
  name        = "demo"
  stage       = "dev"
  image       = "nalbam/sample-spring"
  port        = "8080"
  cpu         = "512"
  memory      = "1024"
  desired     = "1"
  min         = "1"
  max         = "5"
  cidr_block  = "10.8.0.0/16"
  base_domain = "nalbam.com"
}

output "alb_name" {
  value = "${module.fargate.alb_name}"
}

output "dns_name" {
  value = "${module.fargate.dns_name}"
}

# output "dns_name" {
#   count = "${count(module.fargate.dns_name)}"
#   value = "https://${module.fargate.dns_name[count.index]}"
# }
