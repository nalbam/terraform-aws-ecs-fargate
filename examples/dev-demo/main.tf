# ecs fargate

terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-nalbam-seoul"
    key            = "ecs-fargate.tfstate"
    dynamodb_table = "terraform-resource-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}
