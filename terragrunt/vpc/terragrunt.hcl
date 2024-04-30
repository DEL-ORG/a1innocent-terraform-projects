terraform {
  source = "../..//vpc"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}


inputs = {
region = "us-east-1"
tags = {
  "id"             = "2024"
  "owner"          = "Practical"
  "teams"          = "Practical"
  "environment"    = "dev"
  "project"        = "revive"
  "create_by"      = "Innocent"
  "cloud_provider" = "aws"
}

cidr = "10.0.0.0/16"

availability_zone = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c",
]
}