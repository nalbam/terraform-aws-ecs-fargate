# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "seoul-dev-demo-fargate"
}

variable "base_domain" {
  default = "mzdev.be"
}

variable "vpc_id" {
  default = "vpc-025ad1e9d1cb3c27d"
}

variable "subnet_public_ids" {
  default = [
    "subnet-007a2bd91c7939e85",
    "subnet-0477597c240b95aa8",
    "subnet-0c91c5cd95b319b76",
  ]
}

variable "subnet_private_ids" {
  default = [
    "subnet-09a6bcc0e50e97446",
    "subnet-0bf8251e3c5ea6635",
    "subnet-0c599871d06e90acf",
  ]
}
