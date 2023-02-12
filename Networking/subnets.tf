resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_1_cidr
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_2_cidr
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_1_cidr
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_2_cidr
}