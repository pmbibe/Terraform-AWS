terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "terra_state" {
  bucket        = "pmbibe-tf-state"
  tags = {
    Name        = "Terra state bucket"
    Environment = "Dev"
  }
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terra_state_versioning" {
  bucket = aws_s3_bucket.terra_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terra_state_encrypt_conf" {
  bucket        = aws_s3_bucket.terra_state.bucket 
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
