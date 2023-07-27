resource "aws_s3_bucket" "main" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_object" "file_data" {
  bucket      = aws_s3_bucket.main.id
  source_hash = filemd5("${path.module}/data/sample_data.csv")
  key         = "data/sample_data.csv"
  source      = "${path.module}/data/sample_data.csv"
}

resource "aws_s3_bucket_object" "file_scripts" {
  for_each = fileset("${path.module}/scripts", "**/*")
  bucket   = aws_s3_bucket.main.id
  key      = each.value
  source = data.template_file.scripts[each.value].rendered
  source_hash = filemd5(data.template_file.scripts[each.value].rendered)
}

data "template_file" "scripts" {
  for_each = fileset("${path.module}/scripts", "**/*")

  template = "${path.module}/scripts/${each.value}"
  vars = {
    table_name    = var.table_name
    database_name = var.database_name
    bucket_name   = var.bucket_name
  }
}
