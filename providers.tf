provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "Development"
      Project     = "Multier-Project"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}