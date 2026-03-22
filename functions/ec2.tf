resource "aws_instance" "terraform" {
  count = length(var.instance_names)
  ami = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_sg_ssh.id]

  tags = {
    Name = var.instance_names[count.index]
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