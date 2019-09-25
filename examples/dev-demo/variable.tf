# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "seoul-dev-demo-fargate"
}

variable "base_domain" {
  default = "nalbam.com"
}

variable "vpc_id" {
  default = "vpc-075279b4e48b983ff"
}

variable "subnet_public_ids" {
  default = [
    "subnet-08a5b599722126606",
    "subnet-08d4e11f445bb207f",
    "subnet-0706fbc7ebe262da7",
  ]
}

variable "subnet_private_ids" {
  default = [
    "subnet-08a5b599722126606",
    "subnet-08d4e11f445bb207f",
    "subnet-0706fbc7ebe262da7",
  ]
}
