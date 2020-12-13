# subnetaz1a
resource "aws_route_table" "subnetaz1a" {
  vpc_id = aws_vpc.memoapp_vpc.id
    tags = {
    Name = "aws-study-routetable-subnetaz1a"
  }  
}
resource "aws_route" "subnetaz1a" {
  route_table_id         = aws_route_table.subnetaz1a.id
  gateway_id             = aws_internet_gateway.memoapp_igw.id
  destination_cidr_block = "0.0.0.0/0"  
}

resource "aws_route_table_association" "subnetaz1a" {
  subnet_id      = aws_subnet.subnetaz1a.id
  route_table_id = aws_route_table.subnetaz1a.id  
}

# subnetaz1c
resource "aws_route_table" "subnetaz1c" {
  vpc_id = aws_vpc.memoapp_vpc.id 
}

resource "aws_route_table_association" "subnetaz1c" {
  subnet_id      = aws_subnet.subnetaz1c.id
  route_table_id = aws_route_table.subnetaz1c.id 
}
