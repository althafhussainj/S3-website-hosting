output "subnet_id" {
  value = aws_subnet.public[count.index].id
}