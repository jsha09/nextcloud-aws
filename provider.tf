terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
  backend "s3" {
    bucket = "tfm-jh"
    key    = "tfm"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}