data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "suse12" {
  most_recent = true

  filter {
    name   = "name"
    values = ["suse*12-*"]
  }

  filter {
    name   = "image-id"
    values = ["ami-3c062943"] #["ami-1c761163"] #["ami-2a497955"] #["ami-388f9642"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "alpine" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Alpine*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "win2016" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2016-English-Full-Base*"]
  }

  filter {
    name   = "platform"
    values = ["windows"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "wordpress" {
  most_recent = true
  owners      = ["979382823631"]

  filter {
    name   = "name"
    values = ["*bitnami-wordpresspro-5.2*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
