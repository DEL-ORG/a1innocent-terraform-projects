variable "aws_region_main" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "aws_region_backup" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-2"
}

variable "common_tags" {
  type = map(any)
  default = {
    "id"             = "2024"
    "owner"          = "practical"
    "teams"          = "practical"
    "environment"    = "dev"
    "project"        = "s3-bucket"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}