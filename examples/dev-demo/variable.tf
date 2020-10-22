# variable

data "terraform_remote_state" "ecs" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-workshop-seoul"
    key    = "ecs-demo.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-workshop-seoul"
    key    = "vpc-demo.tfstate"
  }
}

variable "region" {
  default = "ap-northeast-2"
}

variable "base_domain" {
  default = "nalbam.com"
}
