resource "aws_glue_job" "create_table" {
  name         = "${var.resource_name}_create_table"
  role_arn     = aws_iam_role.main.arn
  glue_version = "3.0"

  command {
    script_location = "s3://${aws_s3_bucket.main.bucket}/scripts/create_table.py"
  }
}
