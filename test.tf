data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "no_tags" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name      = "HelloWorld"
    yor_trace = "07d07983-7193-4ff2-9590-021945e20044"
  }
}


resource "aws_instance" "pass" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name      = "HelloWorld"
    team      = "dev"
    yor_trace = "d8d53b24-52e2-4d5d-845d-2e923f48dec9"
  }
}

resource "aws_instance" "empty" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name      = "HelloWorld"
    team      = ""
    yor_trace = "0eb187a3-bdcd-4a29-bedb-1b2eb2285bc2"
  }
}

resource "aws_instance" "wrong_team" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name      = "HelloWorld"
    team      = "bad_dev"
    yor_trace = "4974d5aa-ab8f-443e-91e8-327e3c6cb8fa"
  }
}

resource "aws_instance" "tricky_split" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name      = "HelloWorld"
    team      = "bad_dev"
    other     = "dev"
    yor_trace = "4ccdbadd-1770-4ddb-a85f-4b6ec291e9c8"
  }
}