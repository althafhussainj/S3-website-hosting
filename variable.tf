variable "aws_region" {
    description = "AWS Region"
    type = string
}

variable "bucket_name" {
    description = "Name of the bucket"
    type = string
}

variable "cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "az" {
  type = list 
  default = ["us-east-2","us-east-2"]
}