variable "aws_region" {
  type    = string
  default = "us-east-1"

}

variable "instance_class" {
  type    = string
  default = "db.r4.large"

}

variable "aws_rds_cluster" {
  type = map(any)
  default = {
    cluster_identifier  = "postgres-cluster"
    engine              = "aurora-postgresql"
    engine_version      = "11.9"
    database_name       = "mydb"
    master_username     = "a1tinno"
    master_password     = "Postgres123"
    skip_final_snapshot = true
    #     allow_major_version_upgrade = false
    #     auto_minor_version_upgrade  = true
    #     family                      = "postgres13"
    #     zone_id                     = "Z09063052B43KCQ7FSGHY"
    #     aws_route53_record          = "artifactory"

    #     rds_password_secretsmanager_secret_path = "2560-dev-del-artifactory-db-password"
    #     rds_username_secretsmanager_secret_path = "2560-dev-del-artifactory-db-username"
  }
}

variable "tags" {
  type = map(any)
  default = {

    "id"             = "10472"
    "owner"          = "a1tinno"
    "teams"          = "aurora"
    "environment"    = "dev"
    "project"        = "pg"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
