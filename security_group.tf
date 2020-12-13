# EC2 SecurityGroup
resource "aws_security_group" "ec2" {
  vpc_id = aws_vpc.memoapp_vpc.id
    tags = {
    Name = "memoapp-securityGroup-ec2"
  }
}
resource "aws_security_group_rule" "ingress_http" {
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}
resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}
resource "aws_security_group_rule" "ingress_local" {
  type              = "ingress"
  from_port         = "3000"
  to_port           = "3000"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}
resource "aws_security_group_rule" "egress_ec2-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

# RDS SecurityGroup
resource "aws_security_group" "rds" {
  vpc_id = aws_vpc.memoapp_vpc.id
    tags = {
    Name = "memoapp-securityGroup-rds"
  }
}
resource "aws_security_group_rule" "ingress_mysql" {
  type              = "ingress"
  from_port         = "3306"
  to_port           = "3306"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds.id
}
resource "aws_security_group_rule" "egress_rds-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds.id
}