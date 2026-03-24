variable "instances" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z07665621QB3S06Q2RHQ4"
}

variable "domain_name" {
  default = "5starshetty.com"
}