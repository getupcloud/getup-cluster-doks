# File auto-generated from bin/make-versions

terraform {
  required_version = "~> 1.7.0"

  # Example from https://docs.digitalocean.com/products/spaces/reference/terraform-backend/
  backend "s3" {
    endpoints = {
      s3 = "https://-- DEFINE REGION HERE --.digitaloceanspaces.com"
    }

    bucket = "-- DEFINE BUCKET NAME HERE --"
    key    = "-- DEFINE KEY PREFIX HERE --/terraform.tfstate"

    # Deactivate a few AWS-specific checks
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true
    region                      = "us-east-1"
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.11"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.7"
    }
  }
}
