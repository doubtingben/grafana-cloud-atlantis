terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
    
  }
  backend "gcs" {
    bucket  = "grafana-cloud-terraform"
    prefix  = "ceramic"

  }
}

provider "google" {
  project     = "ceramic-hds-testing"
  region      = "us-central1"
}


