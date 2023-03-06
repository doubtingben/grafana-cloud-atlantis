terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    
  }
  backend "gcs" {
    bucket  = "grafana-cloud-terraform"
  }
}

provider "google" {
  project     = "ceramic-hds-testing"
  region      = "us-central1"
}

provider "github" {
  #`GITHUB_TOKEN`
}

data "github_repository" "repo" {
  full_name = "doubtingben/grafana-cloud-atlantis"
}

resource "github_repository_webhook" "webhook" {
  repository = data.github_repository.repo.name

  configuration {
    url          = var.atlantis_webhook_url
    content_type = "application/json"
    secret       = var.atlantis_webhook_secret
  }
  events = ["pull_request", "pull_request_review_comment", "pull_request_review", "issue_comment", "push"]
}

variable "atlantis_webhook_url" {
  type        = string
  description = "The URL of the Atlantis webhook"
  default     = "https://atlantis-2023-02-24.yooser.xyz/events"
}
variable "atlantis_webhook_secret" {
  type        = string
  sensitive   = true
  description = "The secret of the Atlantis webhook"
}
