# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  path = "../terraform.tfstate"
  region = var.aws_region
  backend = "s3"
  config = {
    bucket = "ryan5100"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = var.aws_region
  }
}