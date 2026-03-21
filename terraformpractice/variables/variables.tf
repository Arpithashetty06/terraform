variable "ami_id" {
    type    = string
    default = "ami-051a31ab2f4d498f5"
    description = "this is the ami_id for the instance"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}