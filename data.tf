data "aws_region" "current" {}

data "aws_vpc" "vpc_default" {
  default = true
}
