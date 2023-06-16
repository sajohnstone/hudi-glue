provider "aws" {
  default_tags {
    tags = {
      owner       = "stu.johnstone@cmd.com.au"
      environment = "test"
    }
  }
}
