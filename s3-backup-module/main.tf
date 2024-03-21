
## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  alias  = "main-bucket"
  region = local.aws_region_main
}

provider "aws" {
  alias  = "backup-bucket"
  region = local.aws_region_backup
}


locals {
  aws_region_main   = "us-east-1"
  aws_region_backup = "us-east-2"

  common_tags = {
    "id"             = "2024"
    "owner"          = "practical"
    "teams"          = "practical"
    "environment"    = "dev"
    "project"        = "s3-bucket"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "s3-backet-replication-module" {
  source      = "github.com/DEL-ORG/a1innocent.git//packer2/s3-bucket-replication?ref=main"
  common_tags = local.common_tags
}

  