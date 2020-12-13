resource "aws_instance" "EC2" {
  ami           = "ami-00f045aed21a55240"
  instance_type = "t2.micro"
  subnet_id               = aws_subnet.subnetaz1a.id
  disable_api_termination = false
  instance_initiated_shutdown_behavior = "stop"
  key_name                = "mykey"
  monitoring              = false
  vpc_security_group_ids  = [aws_security_group.ec2.id]
  associate_public_ip_address = true
    tags = {
    Name = "memoapp_ec2"
  }
}
#resource "aws_network_interface_attachment" "EC2" {
  #instance_id          = "${aws_instance.EC2.id}"
  #network_interface_id = "${aws_network_interface.EC2.id}"
  #device_index         = 0
#}
