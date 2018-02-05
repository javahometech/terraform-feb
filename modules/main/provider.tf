provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "javahome-1"
    key    = "terrafom/terraform.tfstate"
    region = "us-east-1"
  }
}
