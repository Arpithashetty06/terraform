terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.0"
    }
  }

  backend "s3" {
    bucket         = "shetty-remote-state"
    key            = "foreach-state-demo"
    region         = "us-east-1"
    dynamodb_table = "5starshetty-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}