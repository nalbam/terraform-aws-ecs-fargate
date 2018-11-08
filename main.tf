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
  image         = "nalbam/sample-node"
  count         = "1"
  cpu           = "250"
  memory        = "512"
  internal_port = "3000"
  external_port = "80"
  cidr_block    = "10.86.0.0/16"
}
