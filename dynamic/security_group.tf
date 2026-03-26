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

    dynamic "ingress" {
        for_each = var.ingress_rules
        
        content {
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = ingress.value.protocol
        cidr_blocks      = ingress.value.cidr_block
        }
    }

    tags = {
        Name = "tf-allow-ssh-sg"
    }
}    