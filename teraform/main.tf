
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  access_key = "ASIAUSMGJ67RAZSOAZY7"
  secret_key = "VhUYiLHXy+QLIerh0fayIl+6IwDcG3IHgAhtdyB9"
  region  = "eu-west-2"
  
}