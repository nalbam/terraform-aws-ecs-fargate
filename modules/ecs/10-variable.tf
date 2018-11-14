# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "city" {
  description = "City Name of the cluster, e.g: VIRGINIA"
}

variable "stage" {
  description = "Stage Name of the cluster, e.g: DEV"
}

variable "name" {
  description = "Name of the cluster, e.g: DEMO"
}

variable "vpc_id" {
  description = "The VPC ID."
  default     = ""
}

variable "cidr_block" {
  description = "The CIDR block of the VPC, e.g: 10.0.0.0/16"
  default     = "10.0.0.0/16"
}

data "aws_availability_zones" "azs" {}
