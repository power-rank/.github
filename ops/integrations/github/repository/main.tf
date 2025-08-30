terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.6"
    }
  }
}

provider "github" {
  owner = local.github_owner
}

resource "github_repository" "readme" {
  name                   = local.repository
  description            = "README.md repository"
  visibility             = "public"
  has_issues             = false
  auto_init              = false
  gitignore_template     = "Terraform"
  delete_branch_on_merge = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_membership" "invite_user" {
  username = "Judit716"
  role     = "member"
}

locals {
  github_owner = "power-rank"
  repository   = ".github"
}
