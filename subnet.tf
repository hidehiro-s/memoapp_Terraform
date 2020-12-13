resource "aws_subnet" "subnetaz1a" {
  vpc_id                  = aws_vpc.memoapp_vpc.id
  cidr_block              = "10.2.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
    tags = {
    Name = "memoapp_subnetaz1a"
  }
}

resource "aws_subnet" "subnetaz1c" {
  vpc_id                  = aws_vpc.memoapp_vpc.id
  cidr_block              = "10.2.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1c"
    tags = {
    Name = "memoapp_subnetaz1c"
  }  
}

resource "aws_db_subnet_group" "rds" {
  name       = "memoapp_rds"
  subnet_ids = [aws_subnet.subnetaz1a.id, aws_subnet.subnetaz1c.id]
}