resource "aws_instance" "terraform" {

  ami = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_sg_ssh.id]

  tags = {
    name = "terraform_instace"
   }
}