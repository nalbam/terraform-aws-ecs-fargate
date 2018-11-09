# variable

variable region {
  default = "ap-northeast-2"
}

variable name {
  default = "demo"
}

variable stage {
  default = "dev"
}

variable image {
  default = "nalbam/sample-web"
}

variable count {
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

variable internal_port {
  default = "8080"
}

variable external_port {
  default = "80"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

data "aws_availability_zones" "available" {}
