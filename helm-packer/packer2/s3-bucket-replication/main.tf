# ... other configuration ...

resource "aws_s3_bucket" "practical-s3-east_1" {
  provider = aws.main-bucket
  bucket   = format("%s-practical-s3", var.common_tags["id"])
}

resource "aws_s3_bucket_versioning" "practical-s3-east_1" {
  bucket = aws_s3_bucket.practical-s3-east_1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "backup-bucket" {
  provider = aws.backup-bucket
  bucket   = format("%s-backup-bucket", var.common_tags["id"])
}

resource "aws_s3_bucket_versioning" "practical-s3-east_2" {
  provider = aws.backup-bucket
  bucket   = aws_s3_bucket.backup-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "east_1to_east2" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.practical-s3-east_1]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.practical-s3-east_1.id

  rule {
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.backup-bucket.arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_s3_bucket_replication_configuration" "east2_to_east1" {
  provider = aws.backup-bucket
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.practical-s3-east_2]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.backup-bucket.id

  rule {

    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.practical-s3-east_1.arn
      storage_class = "STANDARD"
    }
  }
}