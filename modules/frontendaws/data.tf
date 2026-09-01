data "aws_acm_certificate" "wildcard" {
  domain   = "*.nyke.it.com"
  statuses = ["ISSUED"]
  most_recent = true
}
data "aws_iam_policy_document" "s3_oac_policy" {
  statement {
    actions = ["s3:GetObject"]
    resources = [
      "${aws_s3_bucket.frontend_bucket.arn}/*"
    ]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.frontend_cdn.arn]
    }
  }
}