resource "aws_instance" "web" {
  ami = "ami-09e4a44941dca303c"
  instance_type = "t2.micro"
  key_name = "New-KP"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "WebServer"
}

    provisioner "file" {
    source = "./New-KP.pem"
    destination = "/home/ec2-user/New-KP.pem"
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec-user"
      private_key = "${file("./New-KP.pem")}"
    }
  }
}

resource "aws_instance" "db" {
  ami = "ami-09e4a44941dca303c"
  instance_type = "t2.micro"
  key_name = "New-KP"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}

