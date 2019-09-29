variable "aws_region"                  {default = "eu-central-1"}
variable "vpc_id"                      {default = "vpc-0c94cd0ee1a6e0299"}
variable "ssh_key_name"                {default = "andrii.hovorukha"}
variable "bastion_subnet_1"            {default = "subnet-0001f0942fe38be36"}
variable "bastion_subnet_2"            {default = "subnet-07c89816282240598"}

# default ami - ubuntu 18.04. Specify your own
variable "ami_id"                      {default = "ami-04cf43aca3e6f3de3"}

variable "default_tags" {
  type = "map"
  default = {
    Owner   = "AndriiGovorukha@gmail.com"
  }
}