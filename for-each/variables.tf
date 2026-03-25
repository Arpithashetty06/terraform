variable "instances" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z05658833DEQ1PJ2JT3V5"
}

variable "domain_name" {
  default = "5starshetty.com"
}