terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.79.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


terraform {
  backend "s3" {
    bucket = "dev-hamman"
    key    = "qa/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true 
  }
}