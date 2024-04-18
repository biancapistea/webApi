# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.16"
#     }
#   }

#   required_version = ">= 1.2.0"
# }

# variable "aws_region" {
#   type    = string
#   default = "${env("AWS_REGION")}"
# }

# provider "aws" {
#   region = var.aws_region
# }

# //Launch only one instance - provide the VM to the terraform
# resource "aws_instance" "example" {
#   ami           = "ami-0c8bcaea5abf84050"
#   instance_type = "t2.micro"
#   key_name      = "ami"
#   subnet_id     = "subnet-00bd54cb02cc5c5c2"
#   tags = {
#     Name = "ExampleInstance"
#   }
# }