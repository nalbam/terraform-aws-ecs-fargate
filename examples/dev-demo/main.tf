# ecs fargate

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "ecs-fargate.tfstate"
    # encrypt        = true
    # dynamodb_table = "terraform-resource-lock"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}
