resource "aws_instance" "vm" {
  count                   = var.instance_count
  ami                     = var.ec2_instance_ami
  instance_type           = var.ec2_instance_type
  associate_public_ip_address = true
  key_name                = var.ec2_instance_key_name
  vpc_security_group_ids  = [aws_security_group.bastion-sg.id]
  subnet_id               = var.subnet_id
  disable_api_termination = var.enable_termination_protection

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-${var.instance_name}-${count.index + 1}", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}

resource "aws_security_group" "bastion-sg" {
  name        = "allow_tls"
  vpc_id      = var.vpc_id
  tags = {
    Name = "bastion-host-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "bastion-security-rules" {
  security_group_id = aws_security_group.bastion-sg.id
  cidr_ipv4         ="0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
   
}

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.bastion-sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }
