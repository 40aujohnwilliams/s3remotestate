# Author: John Williams
# Site: https://github.com/40aujohnwilliams/s3remotestate
# S3 Remote State Module

resource "aws_s3_bucket" "remote_state_bucket" {
  bucket = "${var.name}"
  acl    = "private"
  region = "${var.region}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name      = "Terraform Remote State Storage"
    terraform = true
  }
}
