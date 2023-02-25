terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
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
    url          = var.atlantis-webhook-url
    content_type = "application/json"
    secret       = var.atlantis-webhook-secret
  }
  events = ["pull_request", "pull_request_review_comment", "pull_request_review", "issue_comment", "push"]
}

variable "atlantis-webhook-url" {
  type        = string
  description = "The URL of the Atlantis webhook"
  default     = "https://atlantis-2023-02-24.yooser.xyz/events"
}
variable "atlantis-webhook-secret" {
  type        = string
  sensitive   = true
  description = "The secret of the Atlantis webhook"
}
