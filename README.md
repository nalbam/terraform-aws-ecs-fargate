# terraform-aws-ecs-fargate

```bash
# aws-cli > 1.15.32
pip3 install awscli

# terraform
brew install terraform

# region
aws configure set default.region ap-northeast-2

# terraform (10m)
terraform init
terraform plan
terraform apply

# ecs
aws ecs list-clusters
aws ecs describe-cluster --name demo
```
