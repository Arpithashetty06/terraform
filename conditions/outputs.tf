output "instance_id" {
  value = aws_instance.terraform.id
}

output "public_ip" {
  value = aws_instance.terraform.public_ip
}