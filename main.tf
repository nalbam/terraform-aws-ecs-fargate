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
  image         = "quay.io/nalbam/sample-web"
  count         = "1"
  cpu           = "256"
  memory        = "512"
  internal_port = "80"
  external_port = "80"
  cidr_block    = "10.86.0.0/16"
}
