terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.2"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    # Create Random Pet Resource

  }
}

provider "aws" {
  region  = var.aws_region
  profile = "default"

}
resource "random_pet" "this" {
  length = 2
}