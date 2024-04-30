terraform {
  source = "../../eks-full//eks-control-plane"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "${get_terragrunt_dir()}/../vpc", 
    ]
}

inputs = {
region                  = "us-east-1"
cluster_name            = "dev-revive"
eks_version             = 1.28
endpoint_private_access = false
endpoint_public_access  = true
tags = {
  "id"             = "2024"
  "owner"          = "Innocent"
  "teams"          = "Practical"
  "environment"    = "dev"
  "project"        = "revive"
  "create_by"      = "Practical"
  "cloud_provider" = "aws"
}
}