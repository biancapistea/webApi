resource "aws_subnet" "subnet1" {
 vpc_id                  = aws_vpc.vpc.id
 availability_zone       = "eu-central-1a"
 map_public_ip_on_launch = true
 cidr_block              = "172.31.16.0/20"

 tags = {
    Name = "LoadBalancer_subnet1"
 }
}

resource "aws_subnet" "subnet2" {
 vpc_id                  = aws_vpc.vpc.id
 availability_zone       = "eu-central-1b"
 map_public_ip_on_launch = true
 cidr_block              = "172.31.32.0/20"

 tags = {
    Name = "LoadBalancer_subnet2"
 }
}


resource "aws_subnet" "subnet3" {
 vpc_id                  = aws_vpc.vpc.id
 availability_zone       = "eu-central-1c"
 map_public_ip_on_launch = true
 cidr_block              = "172.31.0.0/20"

 tags = {
    Name = "LoadBalancer_subnet3"
 }
}