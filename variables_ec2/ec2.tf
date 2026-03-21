resource "aws_instance" "terraform_server" {

    ami           = var.ec2_ami_id          # AMI for EC2 instance
    instance_type = var.ec2_instance_type   # instance type

    vpc_security_group_ids = [aws_security_group.terraform_sg.id]

    tags = var.common_tags                  # common tags for resources
}

resource "aws_security_group" "terraform_sg" {

    name        = var.security_group_name
    description = var.security_group_description

    # Allow all outbound traffic
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    # Allow SSH inbound
    ingress {
        from_port        = var.ssh_from_port
        to_port          = var.ssh_to_port
        protocol         = var.ssh_protocol
        cidr_blocks      = var.allowed_cidr
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.common_tags
}