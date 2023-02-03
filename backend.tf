terraform {
  backend "s3" {
    bucket = "terraformstateln"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-1"
  }
}