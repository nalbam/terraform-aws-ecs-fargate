# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "cluster_id" {
  description = "The ECS Cluster ID."
}

variable "cluster_name" {
  description = "The ECS Cluster Name."
}

variable "vpc_id" {
  description = "VPC ID of the ecs cluster."
}

variable "subnet_public_ids" {
  description = "Public Subnet IDs of the ecs cluster."
  type        = list(string)
}

variable "subnet_private_ids" {
  description = "Private Subnet IDs of the ecs cluster."
  type        = list(string)
}

variable "stage" {
  description = "Stage Name of the ecs fargate app, e.g: dev"
}

variable "name" {
  description = "Name of the ecs fargate app, e.g: sample-spring"
}

variable "image" {
  description = "Image of the ecs fargate app, e.g: nalbam/sample-spring"
}

variable "desired" {
  default = "1"
}

variable "min" {
  default = "1"
}

variable "max" {
  default = "10"
}

variable "cpu" {
  default = "256"
}

variable "memory" {
  default = "512"
}

variable "port" {
  default = "8080"
}

variable "cpu_low" {
  default = "20"
}

variable "cpu_high" {
  default = "80"
}

variable "domain" {
  default = ""
}

variable "base_domain" {
  default = ""
}

data "aws_availability_zones" "azs" {
}
