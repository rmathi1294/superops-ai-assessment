module "webserver1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "webserver1"

  ami           = "ami-0d32650d85b475623"
  instance_type = "t2.micro"
  key_name      = "sample"
  monitoring    = false
  subnet_id     = "subnet-01fa4e5b587c9d959"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "webserver1"
  }
}

resource "aws_eip_association" "webserver1" {
  instance_id   = module.webserver1.id
  allocation_id = aws_eip.webserver1.id
}

resource "aws_eip" "webserver1" {
  vpc = true
}

module "webserver2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "webserver2"

  ami           = "ami-0d32650d85b475623"
  instance_type = "t2.micro"
  key_name      = "sample"
  monitoring    = false
  subnet_id     = "subnet-01fa4e5b587c9d959"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "webserver2"
  }
}

resource "aws_eip_association" "webserver2" {
  instance_id   = module.webserver2.id
  allocation_id = aws_eip.webserver2.id
}

resource "aws_eip" "webserver2" {
  vpc = true
}