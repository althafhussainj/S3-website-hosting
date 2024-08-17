resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr[count.index]
#  availability_zone = var.az[count.index]
  availability_zone = var.az
  count = 2

  tags = {
    Name = "public-sub"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2"

  tags = {
    Name = "private-sub"
  }
}

data "aws_subnets" "sib" {
    filter {
      name = "vpc_id"
      values = [aws_vpc.main.id]
    }
    tags = {
        tier = "public"
    }
  
}