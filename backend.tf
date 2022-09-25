terraform {
  backend "s3" {
    bucket = "iti-terraform-state"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terra-state"
  }
}

#default workspace
#terraform show workspace