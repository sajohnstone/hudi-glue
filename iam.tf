data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.main.id}",
      "arn:aws:s3:::${aws_s3_bucket.main.id}/*",
    ]
  }
}

resource "aws_iam_role" "main" {
  name               = var.resource_name
  description        = "Role for the ${var.resource_name} glue job(s)"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = aws_iam_role.main.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy" "s3_policy" {
  name   = var.resource_name
  role   = aws_iam_role.main.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

