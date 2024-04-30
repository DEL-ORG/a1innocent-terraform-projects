data "aws_subnet" "sub_pub1" {
  filter {
    name   = "tag:Name"
    values = ["1979-assignement_public_subnet-0"]
  }
}

data "aws_subnet" "sub_pub2" {
  filter {
    name   = "tag:Name"
    values = ["1979-assignement_public_subnet-1"]
  }
}

data "aws_subnet" "sub_pub3" {
  filter {
    name   = "tag:Name"
    values = ["1979-assignement_public_subnet-2"]
  }
}

