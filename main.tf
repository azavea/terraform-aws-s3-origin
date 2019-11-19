#
# S3 resources
#
data "aws_iam_policy_document" "read_only_bucket_policy" {
  policy_id = "S3AnonymousReadOnlyPolicy"

  statement {
    sid = "S3ReadOnly"

    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
    ]
  }
}

resource "aws_s3_bucket" "site_bucket" {
  bucket = var.bucket_name
  policy = data.aws_iam_policy_document.read_only_bucket_policy.json
  region = var.region

  cors_rule {
    allowed_headers = var.cors_allowed_headers
    allowed_methods = var.cors_allowed_methods
    allowed_origins = var.cors_allowed_origins
    expose_headers  = var.cors_expose_headers
    max_age_seconds = var.cors_max_age_seconds
  }

  tags = merge(
    {
      Project     = var.project,
      Environment = var.environment
    },
    var.tags,
  )
}

resource "aws_s3_bucket" "access_logs_bucket" {
  bucket = var.logs_bucket_name
  acl    = "log-delivery-write"
  region = var.region

  tags = merge(
    {
      Project     = var.project,
      Environment = var.environment
    },
    var.tags,
  )
}
