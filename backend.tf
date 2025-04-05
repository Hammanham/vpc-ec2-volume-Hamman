terraform {
  backend "s3" {
    bucket = "dev-hamman"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true 
  }
}