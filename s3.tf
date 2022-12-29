resource "aws_s3_bucket" "website_bucket" {
  bucket = var.web_domain
  acl    = "public-read"
  policy = data.aws_iam_policy_document.website_policy_main.json
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
