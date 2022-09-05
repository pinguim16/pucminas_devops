terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-pucminas-328111"
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

}