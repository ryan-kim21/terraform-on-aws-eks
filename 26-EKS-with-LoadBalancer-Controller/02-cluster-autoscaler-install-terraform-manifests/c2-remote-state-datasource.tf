# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "ryan5100"
    key    = "dev/auto-scale/terraform.tfstate"
    region = var.aws_region
  }
}

