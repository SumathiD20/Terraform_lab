# Defining the provider aws
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.77.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
  
  access_key = var.access_key
  secret_key = var.secret_key
}