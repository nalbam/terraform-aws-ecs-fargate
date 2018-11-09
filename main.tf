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
  source        = "./modules/fargate"
  region        = "ap-northeast-2"
  name          = "demo"
  stage         = "dev"
  image         = "nalbam/sample-spring"
  desired       = "1"
  min           = "1"
  max           = "5"
  cpu           = "512"
  memory        = "1024"
  internal_port = "8080"
  external_port = "80"
  cidr_block    = "10.8.0.0/16"
}

output "dns_name" {
  value = "${module.fargate.dns_name}"
}
