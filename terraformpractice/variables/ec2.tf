resource "aws_instance" "terraform" {

    ami = "var.ami_id"
    instance_type = "var.instance_type"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = var.tags
}  


resource "aws_security_group" "allow_ssh_terraform" {
    name        = "allow_ssh_sg" 
    description = "Allow SSH access" #port number 22

    # usually we allow everything in egress
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1" #-1 means allow all outbound traffic
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22 #22 is default ssh port
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone or allow anywhere on the internet
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
        Name = "tf-allow-ssh-sg"
    }
}    