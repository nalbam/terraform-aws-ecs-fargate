# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "cluster_id" {
  description = "The VPC ID."
  default     = ""
}

variable "cluster_name" {
  description = "The VPC ID."
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID."
  default     = ""
}

variable "subnet_public_ids" {
  description = "The VPC ID."
  default     = []
}

variable "subnet_private_ids" {
  description = "The VPC ID."
  default     = []
}

variable "stage" {
  description = "Stage Name of the cluster, e.g: dev"
}

variable "name" {
  description = "Name of the cluster, e.g: sample-spring"
}

variable image {
  default = "nalbam/sample-spring"
}

variable desired {
  default = "1"
}

variable min {
  default = "1"
}

variable max {
  default = "10"
}

variable cpu {
  default = "256"
}

variable memory {
  default = "512"
}

variable port {
  default = "8080"
}

variable "base_domain" {
  default = ""
}

data "aws_availability_zones" "azs" {}
