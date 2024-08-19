variable "cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "az" {
  type = list
  default = ["ap-south-1a","ap-south-1b"]
}

variable "subnet_id" {
  type = list(string)
}

resource "aws_instance" "server" {
  # Create one instance for each subnet
  count = length(var.subnet_id)

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
  #subnet_id     = var.subnet_ids[count.index]
  subnet_id = var.subnet_id[count.index] 

  tags = {
    Name = "Server ${count.index}"
  }
}