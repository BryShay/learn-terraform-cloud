provider "aws" {
  region = "us-east-1"
  access_key= "ASIA6GBMCQCYXG3IWIAZ"
  secret_key= "v5VHJiSMuprfT8Xy+Q63FVXfa0J1sLvorDn8Lv4i"
  token = "IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJHMEUCIQDzywcwqvt3E9tDYUUIqttJ74p9G+Trc0yUvb3Grhp4sAIgSBi7Vabhy5tnk6w/2wJxRKBaIdjUCwEvF8CYMSz0r1oqqQIIUBAAGgw5NzUwNTAwMTQ4OTciDDA/N6NkqeA8y0j10CqGAihQ+uomn1pxYccIItHa6WLZTT9lg3c0P+sTzQp7lPmx5c4lYzlbYjdxZ+Bj4x1Ycab6RKdMnyvf3Mu5M5SXA1ZEJsNyp36aFJJZnUYiHz6cffIvnE/LhT7KhxFGrRJE1v9K6NvDWV72XESzTsTSxx05JitD8oJFksBtWKJaKK+Ohcq1P3w+QSfE1YkE8IVLw52+jtr3LvN9oSP39cofTMJ4tagk+I5VhE1UjPMUwFaxZkS1n1//ORbPxjxyr5xXsHWQ2T+42ZrQsuqTJfpkrjCBeTm0D6cpWxb+1UA5ugoyBeGW9vQd7DW36yDGSXmYIPuwCfQE3yNqoKmAbwaAa86uH8HEIyswr7yWsQY6nQFfaonXTyaOe/JCYS2gKgrICa6B/lxfiiu5JZKf+uDV2k5po/hPzxKk91pwqTa6Kr96sVd299cVM753gjRr/BzHJVnaowdp93uf3aKI7eP8jNwrYune6oXFFgwpiFESnzx9fkBJ63YB2kfWe0/zycsgA9mvR/9MdihCqgzn728ATVT7hTHWgjopJgmzJHBGG9y3PNqnJLuGABLoGNXw"

}

data "aws_ami" "amazon-linux-2" {
 most_recent = true

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }

 owners = ["amazon"]
}

resource "aws_instance" "amazon-linux-2" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
    "Linux Distribution" = "Amazon Linux 2"
  }
  
}
