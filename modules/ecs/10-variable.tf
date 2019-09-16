# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "name" {
  description = "Name of the cluster, e.g: seoul-dev-demo"
}

data "aws_availability_zones" "azs" {
}
