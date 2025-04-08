terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket               = "ptr-usa-tf-tes"
    key                  = "tf-state-deploy"
    region               = "us-west-1"
    encrypt              = true
    dynamodb_table       = "ptr-usa-centra-test-terraform-lock"
    workspace_key_prefix = "tf-state-deploy-env"
  }
}

provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      contact     = var.contact
      ManagedBy   = "Terraform/deploy"
    }
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}

data "aws_region" "current" {}
