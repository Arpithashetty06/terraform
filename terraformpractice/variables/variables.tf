variable "ami_id" {
    type    = string
    default = "ami-051a31ab2f4d498f5"
    description = "this is the ami_id for the instance"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "tags" {
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "Dev"
        terraform = "true"
    } 
}

variable "sg_name" { 
     default = "allow_ssh_sg"
}
  
variable "sg_description" {
    default = "Allow SSH access"
}

variable "from_port" {
    default = "22"
    type = number
}

variable "to_port" {
    default = "22"
    type = number
}

variable "protocol" {}
    default = "tcp"
    type = 
}