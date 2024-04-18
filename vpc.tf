resource "aws_vpc" "vpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    "key" = "LoadBalancer_VPC"
  }
}