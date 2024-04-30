aws_region                    = "us-east-1"
ec2_instance_ami              = "ami-0fc5d935ebf8bc3bc"
ec2_instance_type             = "t2.micro"
sg_name                       = "test"
instance_name                 = "bastion-host"
vpc_id                        = "vpc-0d2aba93d2a01e6ff"
subnet_id                     = "subnet-0780e6fdfc7f9ac3a"
root_volume_size              = 20
instance_count                = 1
enable_termination_protection = false
ec2_instance_key_name         = "devkey2"
associate_public_ip_address   = true
allowed_ports = [
  22
]
tags = {
  "id"             = "2024"
  "owner"          = "practical"
  "teams"          = "DEL"
  "environment"    = "dev"
  "project"        = "del"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}