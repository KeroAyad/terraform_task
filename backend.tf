terraform {
  backend "s3" {
    bucket = "iti-terraform-state"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}