resource "aws_internet_gateway" "memoapp_igw" {
  vpc_id = aws_vpc.memoapp_vpc.id
    tags = {
    Name = "memoapp-igw"
  }  
}