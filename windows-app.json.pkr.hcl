packer {
  required_plugins {
    // amazon = {
    //   source  = "github.com/hashicorp/amazon"
    //   version = "~> 1"
    // }
  }
}

variable "aws_access_key_app" {
  type    = string
  default = "${env("AWS_ACCESS_KEY_ID")}"
}

variable "aws_secret_access_key_app" {
  type    = string
  default = "${env("AWS_SECRET_ACCESS_KEY")}"
}

variable "aws_region_app" {
  type    = string
  default = "${env("AWS_REGION")}"
}

variable "prerequisites_ami" {
  type    = string
  default = "ami-0d0f70de1aeb0ce6"
}

# "timestamp" template function replacement
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "autogenerated_1" {
  ami_name      = "packer application ${local.timestamp}"
  instance_type = "t2.micro"
  source_ami    = var.prerequisites_ami #id of the windows-prerequisites image generated by me

  access_key    = var.aws_access_key_app
  secret_key    = var.aws_secret_access_key_app
  region        = var.aws_region_app
  communicator = "winrm"
  user_data_file = "./bootstrap_win.txt"
  winrm_password = "SuperS3cr3t!!!!"
  winrm_username  = "Administrator"

}

build {
  sources = ["source.amazon-ebs.autogenerated_1"]

    provisioner "powershell" {
    script = "./application.ps1"
  }
}
