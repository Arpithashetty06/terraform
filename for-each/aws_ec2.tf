resource "aws_instance" "terraform" {
  ami           = "ami-02dfbd4ff395f2a1b"
  for_each      = var.instances
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = "tf-ec2-instance"
  }
}
