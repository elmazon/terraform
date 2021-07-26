resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_1_cidr_block
  availability_zone = "us-west-2a"

  tags = {
    Name = "${var.name_tag}-${var.env}-pub1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_2_cidr_block
  availability_zone = "us-west-2b"

  tags = {
    Name = "${var.name_tag}-${var.env}-pub2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_1_cidr_block
  availability_zone = "us-west-2a"

  tags = {
    Name = "${var.name_tag}-${var.env}-prv"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_2_cidr_block
  availability_zone = "us-west-2b"

  tags = {
    Name = "${var.name_tag}-${var.env}-prv2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_3_cidr_block
  availability_zone = "us-west-2a"

  tags = {
    Name = "${var.name_tag}-${var.env}-prv3"
  }
}

resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_4_cidr_block
  availability_zone = "us-west-2b"

  tags = {
    Name = "${var.name_tag}-${var.env}-prv4"
  }
}

