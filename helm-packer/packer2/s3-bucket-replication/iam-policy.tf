resource "aws_iam_policy" "replication" {
  name   = format("%s-aws_iam_policy", var.common_tags["id"])
  policy = data.aws_iam_policy_document.replication.json
}