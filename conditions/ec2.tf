resource "aws_instance" "terraform" {

  ami = "ami-02dfbd4ff395f2a1b"
  instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_sg_ssh.id]

  tags = {
    Name = "terraform_instace"
   }
}



resource "aws_security_group" "allow_sg_ssh" {
    description = "allowing port number 22 ssh"
    name   = "allow_ssh"

  #egress=outgoing traffic
     egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }

  #ingress=incoming traffic
      ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
   
   tags = {
    name = "allow_sg_22"
   }
}