resource "aws_instance" "terraform" {
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t3.micro"

    vpc_security_group_ids = [
    aws_security_group.allow_ssh_terraform.id
  ]

  tags = {
    Name = "tf-ec2-instance"
  }
}
