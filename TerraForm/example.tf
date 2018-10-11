provider "aws" {
  region      = "us-east-1"
  max_retries = 10
}

module "bucket11" {
  source    = "environment"
  enabled   = 0
  ip_ranges = "${var.ip_ranges}"
}

resource "aws_ebs_volume" "data" {
  count             = "1"
  availability_zone = "us-east-1a"
  size              = "5"

  tags {
    Name = "Test volume"
  }
}

resource "aws_key_pair" "sshkey" {
  count      = "${var.ec2_enabled || var.win_ec2_enabled || var.ubuntu_ec2_enabled ? 1: 0}"
  key_name   = "sshkey"
  public_key = "${local.sshkey}"
}
