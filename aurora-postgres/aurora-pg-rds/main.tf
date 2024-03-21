
resource "aws_db_subnet_group" "pg-cluster-sn" {
  name       = "pg-cluster-sn-subnet-group"
  subnet_ids = ["subnet-04914496f0075c201", "subnet-0266ea5d6a0347df2"]
}

resource "aws_security_group" "pg-cluster-sg" {
  name        = "pg-cluster-sg-security-group"
  description = "pg-cluster-sg security group for Aurora DB cluster"
  vpc_id      = "vpc-088508f6696d1c394"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "postgres-cluster" {
  cluster_identifier     = lookup(var.aws_rds_cluster, "cluster_identifier")
  engine                 = lookup(var.aws_rds_cluster, "engine")
  engine_version         = lookup(var.aws_rds_cluster, "engine_version")
  database_name          = lookup(var.aws_rds_cluster, "database_name")
  master_username        = lookup(var.aws_rds_cluster, "master_username")
  master_password        = lookup(var.aws_rds_cluster, "master_password")
  db_subnet_group_name   = aws_db_subnet_group.pg-cluster-sn.name
  vpc_security_group_ids = [aws_security_group.pg-cluster-sg.id]
  skip_final_snapshot    = lookup(var.aws_rds_cluster, "skip_final_snapshot")

#   scaling_configuration {
#     auto_pause               = true
#     min_capacity             = 1
#     max_capacity             = 3
#     seconds_until_auto_pause = 300
#   }

  tags = merge(var.tags, {
    Name = format("%s-%s-cluster", var.tags["teams"], var.tags["project"])
  })
}

resource "aws_rds_cluster_instance" "pg-cluster_instances" {
  count              = 2
  identifier         = "pg-cluster-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.postgres-cluster.id
  instance_class     = var.instance_class
  engine             = lookup(var.aws_rds_cluster, "engine")
  engine_version     = lookup(var.aws_rds_cluster, "engine_version")
}
