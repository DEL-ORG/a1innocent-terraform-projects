resource "aws_iam_role" "eks_cluster" {
  name               = format("%s-%s-eks_cluster_iam_role", var.tags["id"], var.tags["environment"])
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "aws_eks_cluster_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_eks_cluster" "eks-cluster" {
  name = var.eks-cluster

  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.eks-cluster-version

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    subnet_ids              = var.subnet_id
  }
  depends_on = [
    aws_iam_role_policy_attachment.aws_eks_cluster_policy_attachment
  ]
}