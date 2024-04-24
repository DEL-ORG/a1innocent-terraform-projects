variable "region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1300"
    "owner"          = "Practical DevOps"
    "teams"          = "PD"
    "environment"    = "dev"
    "project"        = "S3 Backend"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "k8s.io/cluster-autoscaler/${var.control_plane_name}" = "${var.shared_owned}"
    "k8s.io/cluster-autoscaler/enabled"                   = "${var.enable_cluster_autoscaler}"
  }

}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zone" {
  type = list(any)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]
}