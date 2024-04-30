data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "replication" {
  name               = format("%s-iam-role-replication", var.common_tags["id"])
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
