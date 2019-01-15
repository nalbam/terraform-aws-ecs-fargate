# ecs job

provider "aws" {
  region = "${var.region}"
}

resource "random_string" "suffix" {
  length = 8
}

module "job" {
  source = "../../modules/job"

  region = "${var.region}"
  stage  = "${var.stage}"

  cluster_id         = "arn:aws:ecs:ap-northeast-2:968005369378:cluster/seoul-dev-demo-cluster"
  cluster_name       = "seoul-dev-demo-cluster"
  vpc_id             = "vpc-0cf40c93f4fafc129"
  subnet_public_ids  = ["subnet-0a544fa7eaabb17c2"]
  subnet_private_ids = ["subnet-0abcf62e9748ffd9d"]

  name   = "builder-${random_string.suffix.result}"
  image  = "opspresso/builder"
  port   = "80"
  cpu    = "256"
  memory = "512"
}

output "job_name" {
  value = "${module.job.app_name}"
}
