# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "cluster_id" {
  description = "The ECS Cluster ID."
}

variable "vpc_id" {
  description = "VPC ID of the ecs cluster."
}

variable "subnet_public_ids" {
  description = "Public Subnet IDs of the ecs cluster."
  type        = "list"
}

variable "subnet_private_ids" {
  description = "Private Subnet IDs of the ecs cluster."
  type        = "list"
}

variable "stage" {
  description = "Stage Name of the ecs fargate app, e.g: dev"
}

variable "name" {
  description = "Name of the ecs fargate app, e.g: sample-spring"
}

variable image {
  description = "Image of the ecs fargate app, e.g: nalbam/sample-spring"
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

data "aws_availability_zones" "azs" {}
