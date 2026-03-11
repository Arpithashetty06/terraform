variable "ec2_ami_id" {
  type        = string
  default     = "ami-0f559c3642608c138"
  description = "AMI ID for EC2 instance"
}

variable "ec2_instance_type" {
  type = string
  default = "t3.micro"
}

variable "common_tags" {
  type = map(string)

  default = {
    Name        = "backend"
    Project     = "expense"
    Component   = "backend"
    Environment = "DEV"
    Terraform   = "true"
  }
}

variable "security_group_name" {
  default = "terraform-ssh-sg"
}

variable "security_group_description" {
  default = "Allow SSH access on port 22"
}

variable "ssh_from_port" {
  type    = number
  default = 22
}

variable "ssh_to_port" {
  type    = number
  default = 22
}

variable "ssh_protocol" {
  default = "tcp"
}

variable "allowed_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}