variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "eks-cluster"
}
variable "eks-cluster" {
  type    = string
  default = "eks-cluster"
}
variable "eks-cluster-version" {
  type    = string
  default = "1.28"
}
variable "endpoint_private_access" {
  type    = bool
  default = false
}
variable "endpoint_public_access" {
  type    = bool
  default = true
}
variable "subnet_id" {
  type    = list(string)
  default = [""]
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
  default     = ["subnet-0271bbde0398b033c", "subnet-0d1175dcfca0ddaa0", "subnet-03f53162d2b2b2347"]
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
  default     = ["subnet-0126a7bddda993a7d", "subnet-029e854674db8ffc3", "subnet-0686a09f8fb681caa"]
}

variable "tags" {
  type = map(string)
  default = {
    "id"             = "2024"
    "owner"          = "a1innocent"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "eks-cluster"
    "create_by"      = "Terraform"
  }
}