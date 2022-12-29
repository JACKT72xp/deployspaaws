
# obtener el route53 zone que corresponde a un dominio que controle la cuenta de AWS
data "aws_route53_zone" "selected" {
  name = var.main_domain_name
}


# data del policy a usar en el s3 con los permisos especificos publicos hacia el dominio
data "aws_iam_policy_document" "website_policy_main" {
  statement {
    actions = [
      "s3:*"
    ]
    principals {
      identifiers = ["*"]
      type        = "*"
    }
    resources = [
      "arn:aws:s3:::${var.web_domain}",
      "arn:aws:s3:::${var.web_domain}/*"
    ]
  }
}




