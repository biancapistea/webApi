resource "aws_instance" "ec2" {
  ami                    = "ami-07efe17daa3818b21"
  instance_type          = "t2.micro"
  key_name               = "ami"
  vpc_security_group_ids = [aws_security_group.sgforinstance.id]
  subnet_id              = aws_subnet.subnet1.id
  tags = {
    Name = "Load Balancer - EC2"
  }
}

resource "aws_instance" "ec21" {
  ami                    = "ami-07efe17daa3818b21"
  instance_type          = "t2.micro"
  key_name               = "ami"
  vpc_security_group_ids = [aws_security_group.sgforinstance.id]
  subnet_id              = aws_subnet.subnet2.id
  tags = {
    Name = "Load Balancer - EC21"
  }
}